<div id="SideNavigation">
    <h2><% if $Level(1).ClassName.ShortName != 'PlaceholderPage' %><a class="$LinkingMode" href="$Level(1).Link">$Level(1).MenuTitle.XML</a><% else %>$Level(1).MenuTitle.XML<% end_if %></h2>
    <% if $Level(3) %>
        <ul class="level1 menu list-unstyled">
            <% with $Parent.Parent %>
                <% loop $Children %>
                    <li class="level1 $LinkingMode"><a href="$Link" class="level1 $LinkingMode">$MenuTitle.XML</a>
                        <% if $Children %>
                            <% if $Top.Parent.URLSegment = $URLSegment %>
                                <ul class="level2 menu">
                                    <% loop $Children %>
                                        <li class="level2 $LinkingMode"><a href="$Link" class="level2 $LinkingMode">$MenuTitle.XML</a>
                                            <% if $Children %>
                                                <ul class="level3 menu">
                                                    <% loop $Top.Children %>
                                                        <li class="level3 $LinkingMode"><a href="$Link" class="level3 $LinkingMode">$MenuTitle.XML</a></li>
                                                    <% end_loop %>
                                                </ul>
                                            <% end_if %>
                                        </li>
                                    <% end_loop %>
                                </ul>
                            <% end_if %>
                        <% end_if %>
                    </li>
                <% end_loop %>
            <% end_with %>
        </ul>
    <% else_if $Level(2) %>
        <ul class="level1 menu list-unstyled">
            <% with $Parent %>
                <% loop $Children %>
                    <li class="level1 $LinkingMode"><a href="$Link" class="level1 $LinkingMode">$MenuTitle.XML</a>
                        <% if $Top.URLSegment = $URLSegment %>
                            <% if Children %>
                                <ul class="level2 menu list-unstyled">
                                    <% loop $Top.Children %>
                                        <li class="level2 $LinkingMode"><a href="$Link" class="level2 $LinkingMode">$MenuTitle.XML</a>
                                            <% if $Children %>
                                                <ul class="level3 menu list-unstyled">
                                                    <% loop $Children %>
                                                        <li class="level3 $LinkingMode"><a href="$Link" class="level3 $LinkingMode">$MenuTitle.XML</a></li>
                                                    <% end_loop %>
                                                </ul>
                                            <% end_if %>
                                        </li>
                                    <% end_loop %>
                                </ul>
                            <% end_if %>
                        <% end_if %>
                    </li>
                <% end_loop %>
            <% end_with %>
        </ul>
    <% else_if $Level(1) %>
        <% if $Children %>
            <ul class="level1 menu list-unstyled">
                <% loop $Children %>
                    <li class="level1 $LinkingMode"><a href="$Link" class="level1 $LinkingMode">$MenuTitle.XML</a>
                        <% if $Top.URLSegment = $URLSegment %>
                            <% if $Children %>
                                <ul class="level2 menu">
                                    <% loop $Children %>
                                        <li class="level2 $LinkingMode"><a href="$Link" class="level3 $LinkingMode">$MenuTitle.XML</a></li>
                                    <% end_loop %>
                                </ul>
                            <% end_if %>
                        <% end_if %>
                    </li>
                <% end_loop %>
            </ul>
        <% end_if %>
    <% end_if %>
</div>