﻿using Cofoundry.Core.Mail;
using Cofoundry.Domain;
using Cofoundry.Domain.CQS;
using Cofoundry.Domain.Data;
using Cofoundry.Web;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cofoundry.Samples.SPASite.Domain
{
    /// <summary>
    /// This command handler ties together a number of functions built
    /// into Cofoundry such as saving a new user, sending a notification
    /// and logging them in.
    /// </summary>
    public class RegisterMemberAndLogInCommandHandler
        : IAsyncCommandHandler<RegisterMemberAndLogInCommand>
        , IIgnorePermissionCheckHandler
    {
        private readonly CofoundryDbContext _dbContext;
        private readonly ICommandExecutor _commandExecutor;
        private readonly IUserContextService _userContextService;
        private readonly ILoginService _loginService;
        private readonly IExecutionContextFactory _executionContextFactory;
        private readonly IMailService _mailService;
        
        public RegisterMemberAndLogInCommandHandler(
            CofoundryDbContext dbContext,
            ICommandExecutor commandExecutor,
            IUserContextService userContextService,
            ILoginService loginService,
            IExecutionContextFactory executionContextFactory,
            IMailService mailService
            )
        {
            _dbContext = dbContext;
            _commandExecutor = commandExecutor;
            _userContextService = userContextService;
            _loginService = loginService;
            _executionContextFactory = executionContextFactory;
            _mailService = mailService;
        }

        public async Task ExecuteAsync(RegisterMemberAndLogInCommand command, IExecutionContext executionContext)
        {
            int roleId = await GetMemberRoleId();

            var addUserCommand = MapAddUserCommand(command, roleId);

            await SaveNewUser(executionContext, addUserCommand);
            await SendWelcomeNotification(command);

            // Log the user in. Note that the new user id is set in the OutputUserId which is a 
            // convention used by the CQS framework (see https://www.cofoundry.org/docs/framework/cqs)
            await _loginService.LogAuthenticatedUserInAsync(addUserCommand.UserAreaCode, addUserCommand.OutputUserId, true);
        }

        /// <summary>
        /// Every user needs to be assigned a role. We've created a MemberRole in 
        /// code, so we can our code definition to find out the database id which 
        /// we need to create the new user
        /// </summary>
        private async Task<int> GetMemberRoleId()
        {
            return await _dbContext
                .Roles
                .AsNoTracking()
                .Where(r => r.RoleCode == MemberRole.MemberRoleCode && r.UserAreaCode == MemberUserArea.MemberUserAreaCode)
                .Select(r => r.RoleId)
                .SingleOrDefaultAsync();
        }

        /// <summary>
        /// Because we're not logged in, we'll need to elevate permissions to 
        /// add a new user account. IExecutionContextFactory can be used to get 
        /// an execution context for the system user, which we then use to
        /// execute the command.
        /// </summary>
        private async Task SaveNewUser(IExecutionContext executionContext, AddUserCommand addUserCommand)
        {
            var systemExecutionContext = await _executionContextFactory.CreateSystemUserExecutionContextAsync(executionContext);

            await _commandExecutor.ExecuteAsync(addUserCommand, systemExecutionContext);
        }

        /// <summary>
        /// We're going to make use of the built in AddUserCommand which will take 
        /// care of most of the logic for us. Here we map from our domain command to 
        /// the Cofoundry one. 
        /// 
        /// It's important that we don't expose the AddUserCommand directly in our
        /// web api, which could allow a 'parameter injection attack' to take place:
        /// 
        /// See https://www.owasp.org/index.php/Web_Parameter_Tampering
        /// </summary>
        private AddUserCommand MapAddUserCommand(RegisterMemberAndLogInCommand command, int roleId)
        {
            var addUserCommand = new AddUserCommand();
            addUserCommand.Email = command.Email;
            addUserCommand.FirstName = command.FirstName;
            addUserCommand.LastName = command.LastName;
            addUserCommand.Password = command.Password;
            addUserCommand.RoleId = roleId;
            addUserCommand.UserAreaCode = MemberUserArea.MemberUserAreaCode;

            return addUserCommand;
        }

        /// <summary>
        /// For more info on sending mail with Cofoundry see https://www.cofoundry.org/docs/framework/mail
        /// </summary>
        private async Task SendWelcomeNotification(RegisterMemberAndLogInCommand command)
        {
            var welcomeEmailTemplate = new NewUserWelcomeMailTemplate();
            welcomeEmailTemplate.FirstName = command.FirstName;
            await _mailService.SendAsync(command.Email, welcomeEmailTemplate);
        }
    }
}
