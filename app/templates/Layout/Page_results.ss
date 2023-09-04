<div class="container-fluid bg-white">
    <main class="container-fluid maxed py-10 mb-9">
        <div class="col col-md-7 px-5 px-sm-8 px-xl-0 mx-auto">
            <% if $Query %>
                <p class="searchQuery">You searched for &quot;{$Query}&quot;</p>
            <% end_if %>
            <% if $Results %>
                <% loop $Results %>
                    <article class="card mb-4">
                        <div class="card-body">
                            <h2>$Title</h2>
                            <p><a href="$Link">$Link</a></p>
                            <% if $Summary %>
                                <p>$Summary</p>
                            <% else_if $Content %>
                                <p>$Content.ContextSummary</p>
                            <% end_if %>
                            <a class="btn btn-primary float-right text-uppercase" href="$Link" title="Visit the $Title page">Visit page&hellip;</a>
                        </div>
                    </article>
                <% end_loop %>
            <% else %>
                <p>Sorry, your search query did not return any results.</p>
            <% end_if %>

            <% if $Results.MoreThanOnePage %>
                <nav aria-label="Search results pages">
                    <ul class="pagination">
                        <% if $Results.NotFirstPage %>
                            <li class="page-item"><a href="$Articles.PrevLink" class="page-link">Previous</a></li>
                        <% end_if %>
                        <% loop $Results.Pages %>
                            <% if $CurrentBool %>
                                <li class="page-item active"><span class="page-link" href="#">$PageNum<span class="sr-only"> (current)</span></span></li>
                            <% else %>
                                <li class="page-item"><a class="page-link" href="$Link">$PageNum</a></li>
                            <% end_if %>
                        <% end_loop %>
                        <% if $Results.NotLastPage %>
                            <li class="page-item"><a href="$Articles.NextLink" class="page-link">Next</a></li>
                        <% end_if %>
                    </ul>
                </nav>
            <% end_if %>
        </div>
    </main>
</div>
