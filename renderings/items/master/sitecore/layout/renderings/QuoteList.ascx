<%@Import Namespace="Sitecore.Links"%>
<ul>
<% foreach (Sitecore.Data.Items.Item item in Sitecore.Context.Item.Children) {%>
    <li>
        <div class="row">
            <blockquote>
                <p><%=item["Quote"]%></p>
                <footer><a href="<%=LinkManager.GetItemUrl(item)%>"><%=item["Author"]%></a></footer>
            </blockquote>        
        </div>
    </li>
<% } %>
</ul>