<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>


<h2>${ctx.name}</h2>

<div>${ctx.description|n}</div>

<%def name="sidebar()">
    <%util:well title="Languages">
        ${util.dl_table(('recipient', h.link(request, ctx.recipient)), ('donor', h.link(request, ctx.donor)))}
    </%util:well>
</%def>
