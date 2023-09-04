<header>
    <% include PageImage %>
        <% if $Query %>
            <h1>Search Results</h1>
        <% else_if $ClassName.ShortName ="HomePage" %>
            <h1>$PageHeader</h1>
        <% else_if $ClassName.ShortName ="NewsArticle" %>
            <a class="h1 text-decoration-none" href="$Parent.Link">$Parent.Title</a>
        <% else %>
            <h1 class="mb-6">$Title<% if $Credentials %>, $Credentials<% end_if %><% if $JobTitle %> <span class="d-block h2">$JobTitle</span><% end_if %></h1>
        <% end_if %>
</header>