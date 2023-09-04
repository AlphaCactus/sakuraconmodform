<% if $SiteConfig.Facebook || $SiteConfig.Twitter || $SiteConfig.Instagram || $SiteConfig.YouTube || $SiteConfig.LinkedIn || $SiteConfig.Pinterest %>
	<ul class="list-unstyled social d-inline-flex">
		<% if $SiteConfig.Facebook %>
			<li class="mb-8 mr-5"><a href="$SiteConfig.Facebook" target="_blank" class="text-decoration-none"><% include facebook %></a></li>
		<% end_if %>

		<% if $SiteConfig.Instagram %>
			<li class="mb-8 mr-5"><a href="$SiteConfig.Instagram" target="_blank" class="text-decoration-none"><% include instagram %></a></li>
		<% end_if %>

		<% if $SiteConfig.LinkedIn %>
			<li class="mb-8 mr-5"><a href="$SiteConfig.LinkedIn" target="_blank" class="text-decoration-none"><% include linkedin %></a></li>
		<% end_if %>

		<% if $SiteConfig.Twitter %>
			<li class="mb-8 mr-5"><a href="$SiteConfig.Twitter" target="_blank" class="text-decoration-none"><% include twitter %></a></li>
		<% end_if %>

		<% if $SiteConfig.YouTube %>
			<li class="mb-8 mr-5"><a href="$SiteConfig.YouTube" target="_blank" class="text-decoration-none"><% include youtube %></a></li>
		<% end_if %>

		<% if $SiteConfig.Pinterest %>
			<li class="mb-8 mr-5"><a href="$SiteConfig.Pinterest" target="_blank" class="text-decoration-none"><% include pinterest %></a></li>
		<% end_if %>
	</ul>
<% end_if %>
