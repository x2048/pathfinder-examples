# Isolated Development Example

This example illustrates how deployment process can be separated 
from development process. The example consists of two projects
serving different purposes: develop and deploy.

Assumed development flow is:
 
   * Developer works with the definitions in *develop* project without
     necessarily using a Sitecore instance. As a result a Nuget package
     is produced which can be reused in other projects or installed on
     a Sitecore instance.
     
   * Later a Sitecore administrator or a developer uses *deploy* project
     to install the package on the configured Sitecore instance.
     
In this example projects communicate via a Nuget feed:

   * `build.bat` in *develop* project will compile the Nuget package and push
     it to the default Nuget source.
     
   * *deploy* project has a dependency on the produced package in both 
     `scconfig.json` and `Sitecore.nuspec` files. Pathfinder will download
     the required packages before compiling and deploying the project.
     
By default both projects will interact with the default Nuget feed at http://nuget.org
     
In order test the work flow locally use the following setup:

   * Specify a local folder in Nuget.config file:
   
   ```
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <config>
        <add key="DefaultPushSource" value="C:\Demo\Nuget" />
      </config>
    </configuration>
   ```

   * Configure Pathfinder to use local folder using environment:
     set the environment varialbe `nuget-repositories:local` to 
     the path to the local folder, e.g. `C:\Demo\Nuget`
   
   ```
   set nuget-repositories:local=C:\Demo\Nuget
   ```
