angular.module('cms.directories').run(['$templateCache',function(t){t.put('/Admin/Modules/Directories/Js/UIComponents/DirectoryGrid.html','<cms-table-container ng-if="vm.pageDirectories.length">    <table>        <thead>            <tr>                <th>Name</th>                <th># pages</th>                <th class="lowPriority">Created</th>                <th cms-table-column-actions>Actions</th>            </tr>        </thead>        <tbody>            <tr ng-repeat="pageDirectory in ::vm.pageDirectories">                <td>                    <span>{{::vm.getPathDepthIndicator(pageDirectory.depth)}}</span>                    <a ng-href="#/{{::pageDirectory.pageDirectoryId}}">{{::pageDirectory.name }}</a><br>                    <span class="invisible">{{::vm.getPathDepthIndicator(pageDirectory.depth)}}</span> {{::pageDirectory.fullUrlPath}}                </td>                <td>                    <a ng-href="pages#/?pageDirectoryId={{::pageDirectory.pageDirectoryId}}">{{::pageDirectory.numPages}}</a>                </td>                <td class="lowPriority">                    <cms-table-cell-created-audit-data cms-audit-data="::pageDirectory.auditData"></cms-table-cell-created-audit-data>                </td>                <td cms-table-column-actions>                    <a href="#/{{::pageDirectory.pageDirectoryId}}"                       class="btn-icon"                       title="Edit"                       ng-if="!vm.redirect && vm.canUpdate">                        <i class="fa fa-pencil-square-o"></i>                    </a>                    <a href="#/{{::pageDirectory.pageDirectoryId}}"                       class="btn-icon"                       title="Edit"                       ng-if="vm.redirect && vm.canUpdate">                        <i class="fa fa-external-link"></i>                    </a>                </td>            </tr>        </tbody>    </table></cms-table-container><span ng-if="!vm.pageDirectories.length">No directories could be found.</span>');
t.put('/Admin/Modules/Directories/Js/Routes/AddDirectory.html','<cms-page-header cms-title="Create"                 cms-parent-title="Directory"></cms-page-header><cms-form cms-name="mainForm"           ng-submit="vm.save()"           cms-loading="vm.formLoadState.isLoading">    <!-- Default toolbar -->    <cms-page-actions>        <cms-button-submit class="main-cta"  cms-text="Save" ng-disabled="vm.mainForm.$invalid"></cms-button-submit>        <cms-button cms-text="Cancel" ng-click="vm.cancel()"></cms-button>    </cms-page-actions>    <!-- Scrollable content area -->    <cms-page-body cms-content-type="form">        <cms-form-status></cms-form-status>        <!--Page URL-->        <cms-form-section cms-title="Directory url">            <cms-form-field-text cms-title="Name"                                 cms-model="vm.command.name"                                 cms-description="A descriptive identifier, only used for managing the directory e.g. \'About the team\' or \'Our products\'"                                 cms-change="vm.onNameChanged()"                                 maxlength="64"                                 required></cms-form-field-text>            <cms-form-field-text cms-title="Url Path"                                 cms-model="vm.command.urlPath"                                 cms-description="Lowercase alpha-numeric characters and dashes only. E.g. \'about-the-team\' or \'products\'."                                 pattern="^[a-zA-Z0-9-]+$"                                 pattern-val-msg="Alpha-numeric characters and dashes only"                                 maxlength="64"                                 required></cms-form-field-text>            <cms-form-field-directory-selector cms-model="vm.command.parentPageDirectoryId"                                                   cms-title="Parent Directory"                                                   cms-description="The parent under which to create this new directory"                                                   cms-on-loaded="vm.onDirectoriesLoaded()"                                                   required></cms-form-field-directory-selector>        </cms-form-section>    </cms-page-body></cms-form>');
t.put('/Admin/Modules/Directories/Js/Routes/DirectoryDetails.html','<cms-page-header cms-title="{{vm.pageDirectory.urlPath}}"                 cms-parent-title="Directories"></cms-page-header><cms-form cms-name="mainForm"          cms-edit-mode="vm.editMode"          ng-submit="vm.save()"          cms-loading="vm.formLoadState.isLoading">    <!-- Default toolbar -->    <cms-page-actions ng-show="!vm.editMode && vm.pageDirectory.depth !== 0">        <cms-button class="main-cta"                    cms-text="Edit"                    ng-click="vm.edit()"                    ng-disabled="vm.globalLoadState.isLoading"                    ng-if="::vm.canUpdate"></cms-button>                <cms-button cms-text="Delete"                    ng-click="vm.deleteDirectory()"                    ng-disabled="vm.globalLoadState.isLoading"                    ng-if="::vm.canDelete"></cms-button>    </cms-page-actions>    <!-- Edit toolbar -->    <cms-page-actions ng-show="vm.editMode">        <cms-button-submit cms-text="Save"                           ng-disabled="vm.mainForm.$invalid || vm.globalLoadState.isLoading"                           cms-loading="vm.saveLoadState.isLoading"></cms-button-submit>        <cms-button cms-text="Cancel"                    ng-click="vm.cancel()"                    ng-disabled="vm.globalLoadState.isLoading"></cms-button>    </cms-page-actions>    <!-- Scrollable content area -->    <cms-page-body cms-content-type="form">        <cms-warning-message ng-show="vm.pageDirectory.depth === 0">            The root directory cannot be modified.        </cms-warning-message>        <cms-form-status></cms-form-status>        <!--MAIN-->        <cms-form-section cms-title="Main">            <cms-form-field-text cms-title="Name"                                 cms-model="vm.command.name"                                 cms-change="vm.onNameChanged()"                                 cms-description="A descriptive identifier, only used for managing the directory"                                 maxlength="64"                                 required></cms-form-field-text>            <cms-form-field-text cms-title="Url Path"                                 cms-model="vm.command.urlPath"                                 cms-description="{{vm.hasChildContent ? \'The path cannot be changed because it would change the path of existing pages or child directories\' : \'\'}}"                                 ng-disabled="vm.hasChildContent"                                 maxlength="64"                                 required></cms-form-field-text>            <cms-form-field-dropdown cms-title="Parent Directory"                                     cms-options="vm.parentDirectories"                                     cms-option-name="fullUrlPath"                                     cms-option-value="pageDirectoryId"                                     cms-model="vm.command.parentPageDirectoryId"                                     cms-description="{{vm.hasChildContent ? \'The parent directory cannot be changed because it would change the path of existing pages or child directories\' : \'\'}}"                                     ng-if="vm.pageDirectory.depth !== 0"                                     ng-disabled="vm.hasChildContent"                                     required></cms-form-field-dropdown>            <cms-form-field-readonly cms-title="Full Path"                                     cms-model="vm.pageDirectory.fullUrlPath"></cms-form-field-readonly>            <cms-form-field-container cms-title="Pages">                <a ng-href="pages#/?pageDirectoryId={{::vm.pageDirectory.pageDirectoryId}}">{{::vm.pageDirectory.numPages}}</a>            </cms-form-field-container>            <cms-form-field-readonly cms-title="Child Directories"                                     cms-model="::vm.pageDirectory.childPageDirectories.length"></cms-form-section>        <!--DIRECTORIES-->        <cms-form-section cms-title="Child Directories">            <cms-form-field-container>                <cms-directory-grid cms-directories="vm.pageDirectory.childPageDirectories"                                    cms-start-depth="vm.pageDirectory.depth"                                    cms-redirect="true"></cms-directory-grid>            </cms-form-field-container>        </cms-form-section>        <!--AUDIT DATA-->        <cms-form-section-audit-data audit-data="vm.pageDirectory.auditData"></cms-form-section-audit-data>    </cms-page-body></cms-form>');
t.put('/Admin/Modules/Directories/Js/Routes/DirectoryList.html','<!--HEADER--><cms-page-header cms-title="Directories"></cms-page-header><cms-page-actions>    <cms-button-link class="main-cta"                     cms-text="Create"                     cms-icon="plus"                     cms-href="#/new"                     ng-if="::vm.canCreate"></cms-button-link>    <!--RESULTS-->    <cms-pager cms-result="vm.result"               cms-query="vm.query"></cms-pager></cms-page-actions><cms-page-body cms-content-type="form">    <cms-directory-grid cms-directories="vm.result"                        cms-loading="vm.gridLoadState.isLoading"></cms-directory-grid></cms-page-body>');}]);