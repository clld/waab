<%inherit file="../home_comp.mako"/>
<%namespace name="util" file="../util.mako"/>

<h2>${request.dataset.name}</h2>
<p>
    ${h.cite_button(request, ctx)}
</p>
<% citation = h.get_adapter(h.interfaces.IRepresentation, ctx, request, ext='md.txt') %>
<blockquote>
    ${h.newline2br(citation.render(ctx, request))|n}
</blockquote>

${request.map.render()}
