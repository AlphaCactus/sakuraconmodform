<div class="row">
	<main class="col">
		$Content
		$Form
	</main>
</div>
<% if $AllChildren %>
	<div class="row">
		<% loop $AllChildren %>
			<% if $Content %>
				<a class="card border-0 mb-4 col-12 col-sm-6 col-md-4" href="$Link">
			<% else %>
				<div class="card border-0 mb-4 col-12 col-sm-6 col-md-4">
			<% end_if %>
				<img src="$BioImage.FocusFill(350,350).Link" class="card-img-top" alt="$BioImage.Title">
				<div class="card-body px-0 pt-3 pb-0">
					<h2 class="h5 card-title">$Title<% if $Credentials %>, $Credentials<% end_if %><% if $JobTitle %> <span class="d-block h6">$JobTitle</span><% end_if %></h2>
				</div>
			<% if $Content %>
				</a>
			<% else %>
				</div>
			<% end_if %>
		<% end_loop %>
	</div>
<% end_if %>
