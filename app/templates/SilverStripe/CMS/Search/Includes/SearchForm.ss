<form $FormAttributes>
	<% if $Message %>
		<p id="{$FormName}_error" class="message $MessageType">$Message</p>
	<% end_if %>
	<% loop $Fields %>
		$FieldHolder
	<% end_loop %>
	<% loop $Actions %>
		$Field
	<% end_loop %>
</form>
