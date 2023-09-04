<footer class="container pt-8">
    <% if $SiteConfig.Facebook || $SiteConfig.Twitter || $SiteConfig.Instagram || $SiteConfig.YouTube || $SiteConfig.LinkedIn || $SiteConfig.Pinterest %>
        <div class="container-fluid maxed text-center text-sm-left footer-middle">
            <div class="row py-10">
                <div class="col-12 col-sm-6 col-md-4 offset-md-1">
                    <h2 class="text-uppercase rule-before mb-8">Connect with Us</h2>
                    <% include Social %>
                </div>
            </div>
        </div>
    <% end_if %>
    <div class="row" itemscope itemtype="https://schema.org/LocalBusiness">
        <link itemprop="logo" href="<%-- add path to logo file --%>">
        <link itemprop="url" href="$AbsoluteBaseURL">
        <div class="col">
            <p class="d-inline"><small>&copy;$Now.Format('y') <span itemprop="name">{$SiteConfig.Title}</span>.
                <% if $SiteConfig.Address %>
                    <span itemprop="location" itemscope itemtype="https://schema.org/PostalAddress">
                        <span itemprop="streetAddress">$SiteConfig.Address</span>,
                        <span itemprop="addressLocality">$SiteConfig.City</span>,
                        <span itemprop="addressRegion">$SiteConfig.State</span>
                        <span itemprop="postalCode">$SiteConfig.Zip</span>
                        <% if $SiteConfig.Country %>, <span itemprop="addressCountry">$SiteConfig.Country</span><% end_if %></span>
                    <span><% if $SiteConfig.Phone %>
                        <span itemprop="contactPoint" itemscope itemtype="https://schema.org/ContactPoint">
                            <meta itemprop="contactType" content="customer service"/>
                            <span itemprop="telephone"><a href="tel:$SiteConfig.Phone">$SiteConfig.Phone</a></span>
                        </span>
                    <% end_if %><% if $SiteConfig.TollFree %><br>
                        <span itemprop="telephone">$SiteConfig.TollFree</span><% end_if %></span>
                <% end_if %>
                Site Design &copy;$Now.Format('y') <% if $ClassName.ShortName = "HomePage" %><a href="https://www.116andwest.com" target="_blank">116 &amp; West</a><% else %>116 &amp; West<% end_if %>. All rights reserved.</small></p>
            <% if $Page('footer-links') %><ul class="d-inline-flex list-unstyled"><% with $Page('footer-links') %><% loop $Children %><li class="mr-4"><a href="$Link"<% if $RedirectionType ="External" %> target="_blank"<% end_if %> class="small">$MenuTitle</a></li><% end_loop %><% end_with %></ul><% end_if %>
            <% if $SiteConfig.Disclaimer %>
                <p class="disclaimer small">$SiteConfig.Disclaimer</p>
            <% end_if %>
        </div>
    </div>
</footer>
