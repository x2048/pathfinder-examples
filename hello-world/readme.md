# Hello World

This is a minimal example showing how to define a Sitecore item using JSON item notation and
how to attach an ASP.NET MVC view to the item.


The item is defined in `items/master/sitecore/content/Home/Hello.item.json` and uses `Layout.File` attribute to
reference `views/Hello.cshtml` view.

Invoke `scc` to deploy the project to Sitecore instance.

Open http://pathfinder/Hello to see Pathfinder saying hello :)

 