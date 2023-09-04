<!DOCTYPE html>
<html lang="en">
<head>
	<% base_tag %>
	<title><% if $MetaTitle %>$MetaTitle<% else %>$MenuTitle<% end_if %> &raquo; $SiteConfig.Title</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	$MetaTags(false)
	<link rel="shortcut icon" href="public/favicon.ico" />

	<script type="application/ld+json">
	{
		"@context": "https://schema.org",
		"@type": "MedicalOrganization",
		"name": "$SiteConfig.Title",
		"image": "{$AbsoluteBaseURL}images/sunshine-logo-for-rich-markup.png",
		"telephone": "$SiteConfig.PhoneNumber",
		"address":{
			"@type": "PostalAddress",
			"addressLocality": "$SiteConfig.City",
			"addressRegion": "$SiteConfig.State",
			"addressCountry": "$SiteConfig.Country",
			"postalCode": "$SiteConfig.ZipCode",
			"streetAddress": "$SiteConfig.StreetAddress"
		}
	}
	</script>

	<!--OpenGraph http://ogp.me/-->
	<meta property="og:site_name" content="$SiteConfig.Title" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="$Title" />
	<meta property="og:url" content="$AbsoluteLink" />
	<meta property="og:locale" content="en_US" />

	<% if $MetaDescription %>
		<meta property="og:description" content="$MetaDescription.NoHTML" />
	<% else_if $Summary %>
		<meta property="og:description" content="$Summary.NoHTML" />
	<% else_if $Content %>
		<meta property="og:description" content="$Content.FirstParagraph.NoHTML" />
	<% end_if %>

	<!-- Google Tag Manager -->
	<!-- End Google Tag Manager -->
</head>
<body class="<% if not $Query && $ClassName.ShortName = "HomePage" %>HomePage<% else_if $Query %>Page_results interior<% else_if $ClassName.ShortName = "VirtualPage" %>$CopyContentFrom.ClassName.ShortName<% else %>$ClassName.ShortName interior<% end_if %>">
	<% include Navigation %>
	<article class="container">
		<% include Header %>
		$Layout
	</article>
	<% include Footer %>
</body>
</html>
