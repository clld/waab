<%inherit file="../home_comp.mako"/>
<%namespace name="util" file="../util.mako"/>

<%def name="sidebar()">
    <% citation = h.get_adapter(h.interfaces.IRepresentation, ctx, request, ext='md.txt') %>
    <%util:well>
        ${h.newline2br(citation.render(ctx, request))|n}
        ${h.cite_button(request, ctx)}
    </%util:well>
</%def>

<h2>The World Atlas of Affix Borrowing</h2>

<p class="lead">
    Abstract.
</p>
<p>
    More content.
</p>
