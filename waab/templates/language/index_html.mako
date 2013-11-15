<%inherit file="../waab.mako"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "languages" %>
<%block name="title">Map</%block>

<h2>Map</h2>

${request.map.render()}

<script>
$(document).ready(function() {
    $('#legend-values-opener').click();
});
</script>
