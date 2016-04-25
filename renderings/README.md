# Various Renderings and Layouts

This example illustrates various ways to configure Sitecore layout engine 
and various types of renderings that can be used with Pathfinder.

Layout formats:

   * **.master.layout.json** - a subtype of `.layout.json` layout 
     definition files which is connected to renderings in *master* database.
   * **.page.html** - an lean X(HT)ML-based layout definition format.

Rendering formats:

   * **.cshtml** - ASP.NET MVC Views 
   * **.ascx** - ASP.NET sublayouts (for use with .aspx layouts)
   * **.html** - Really simple Mustache-based MVC views.

## Setting

Having a list of product categories and products, display a list of 
products, a gallery and create product page for each product.

Layouts are defined on:

  * Product template
  * Products item
  