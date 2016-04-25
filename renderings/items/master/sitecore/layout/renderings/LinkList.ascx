<%@Import Namespace="Sitecore.Links"%>
<ul>
<% foreach (Sitecore.Data.Items.Item item in Sitecore.Context.Item.Children) {%>
    <li>
   
        <a href="<%=LinkManager.GetItemUrl(item)%>"><%=item.Name%></a>
    </li>
<% } %>
</ul>