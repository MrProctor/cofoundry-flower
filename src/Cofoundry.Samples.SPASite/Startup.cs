﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Cofoundry.Web;
using Microsoft.AspNetCore.Hosting;
using VueCliMiddleware;

namespace Cofoundry.Samples.SPASite
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(o => o.AddPolicy("MyPolicy", builder =>
            {
                builder.AllowAnyOrigin()
                    .AllowAnyMethod()
                    .AllowAnyHeader();
            }));

            services.AddSpaStaticFiles(configuration =>
            {
                configuration.RootPath = "ClientApp/dist";
            });
            
            services
                .AddMvc()
                .AddCofoundry(Configuration)
                ;
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (!env.IsDevelopment())
            {
                app.UseHsts();
            }
            app.UseCors(builder => builder.AllowAnyOrigin());
            app.UseHttpsRedirection();
            app.UseSpaStaticFiles();
            app.UseCofoundry();

            app.UseSpa(spa =>
            {
                spa.Options.SourcePath = "ClientApp";

                if (env.IsDevelopment())
                {
                    // Un-comment this to run the vue cli automatically when debugging
                    // You'll need to install the vue cli, see https://cli.vuejs.org/guide/installation.html 
#if DEBUG
                    spa.UseVueCli(npmScript: "serve", port: 8081); // optional port
#endif
                }
            });
        }
    }
}
