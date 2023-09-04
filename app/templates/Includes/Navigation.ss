<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-6">
	<div class="container">
		<p class="navbar-brand">
			<% if $Query || $ClassName.ShortName != 'HomePage' %>
				<a href="/" class="text-white">
			<% end_if %>
			<% if $SiteConfig.SiteLogo %>
				<img src="$SiteConfig.SiteLogo.Link" alt="" width="200">
			<% else %>
				$SiteConfig.Title <span class="d-block">$SiteConfig.Tagline</span>
			<% end_if %>
			<span class="sr-only">$SiteConfig.Title</span>
			<% if $Query || $ClassName.ShortName != 'HomePage' %>
				</a>
			<% end_if %>
		</p>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNavigation" aria-controls="mainNavigation" aria-expanded="false" aria-label="Toggle navigation">
			<span class="icon-bar one"></span>
			<span class="icon-bar two"></span>
			<span class="icon-bar three"></span>
		</button>
		<div class="collapse navbar-collapse" id="mainNavigation">
			<div class="d-flex flex-column w-100">
				<% if $Page('quick-links') %><ul class="d-flex justify-content-end list-unstyled"><% with $Page('quick-links') %><% loop $Children %><li class="mr-4 flex-grow-0 flex-shrink-0"><a href="$Link"<% if $RedirectionType ="External" %> target="_blank"<% end_if %> class="small">$MenuTitle</a></li><% end_loop %><% end_with %></ul><% end_if %>
				<ul class="navbar-nav ml-auto sf-menu level1" role="presentation">
					<% loop $Menu(1) %>
						<li class="$LinkingMode $FirstLast<% if $Children %> has-children<% end_if %>">
							<% if $ClassName.ShortName = "PlaceholderPage" %>
								<span class="nav-link $LinkingMode placeholder" tabindex="0">$MenuTitle.XML</span>
							<% else %>
								<a href="$Link" class="nav-link $LinkingMode" <% if $ExternalURL || $InternalFile || $RedirectionType ='External' %> target="_blank"<% end_if %> tabindex="0">$MenuTitle.XML<% if $LinkingMode = "current" %> <span class="sr-only">(current)</span><% end_if %></a>
							<% end_if %>
							<% if $Children %>
								<ul class="px-2 list-unstyled level2" role="presentation">
									<% loop $Children %>
										<li class="$LinkingMode $FirstLast<% if $Children %> has-children<% end_if %>">
											<% if $ClassName.ShortName = "PlaceholderPage" %>
												<span class="nav-link $LinkingMode placeholder">$MenuTitle.XML</span>
											<% else %>
												<a href="$Link" class="nav-link $LinkingMode"<% if $ExternalURL || $InternalFile || $RedirectionType ='External' %> target="_blank"<% end_if %>>$MenuTitle.XML<% if $LinkingMode = "current" %> <span class="sr-only">(current)</span><% end_if %></a>
											<% end_if %>
											<% if $Children %>
												<ul class="px-2 list-unstyled level3" role="presentation">
													<% loop $Children %>
														<li class="$LinkingMode $FirstLast">
															<a href="$Link" class="nav-link $LinkingMode"<% if $ExternalURL || $InternalFile || $RedirectionType ='External' %> target="_blank"<% end_if %>>$MenuTitle.XML<% if $LinkingMode = "current" %> <span class="sr-only">(current)</span><% end_if %></a>
														</li>
													<% end_loop%>
												</ul>
											<% end_if %>
										</li>
									<% end_loop%>
								</ul>
							<% end_if %>
						</li>
					<% end_loop %>
				</ul>
			</div>
		</div>
	</div>
</nav>
