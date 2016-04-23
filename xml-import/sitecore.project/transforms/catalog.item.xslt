<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:c="catalog"
  xmlns="http://www.sitecore.net/pathfinder/item"
  exclude-result-prefixes="c">

  <!-- output directives -->
  <xsl:output method="xml" indent="yes" encoding="UTF-8"  />

  <xsl:template match="/">
    <xsl:apply-templates select="c:catalog" />
  </xsl:template>
  
  <xsl:template match="c:catalog">
    <Item Name="Catalog" Template="Folder">
      <Children>
        <xsl:apply-templates select="c:book"/>
      </Children>
    </Item>
  </xsl:template>
  
  <xsl:template match="c:book">
    <Item Name="{@id}" Template="Book">
      <Fields>
        <Field Name="__Display Name" Value="{c:title}"/>

        <Field Name="Title" Value="{c:title}"/>
        <Field Name="Description" Value="{c:description}"/>
        <Field Name="Author" Value="{c:author}"/>
        
        <Field Name="Id" Value="{@id}"/>
        <Field Name="Genre" Value="{c:genre}"/>
        <Field Name="Price" Value="{c:price}"/>
        <Field Name="PublishDate">
          <xsl:attribute name="Value">
            <xsl:value-of select="translate(c:publish_date, '-', '')"/>
          </xsl:attribute> 
        </Field>
      </Fields>
    </Item>
  </xsl:template>
  
</xsl:stylesheet>
