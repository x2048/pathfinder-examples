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
     
   