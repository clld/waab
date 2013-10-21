<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>


<h2>${ctx.name}</h2>

% if ctx.donor_assocs:
    is a recipient in
    <ul>
        % for pair in ctx.donor_assocs:
        <li>${h.link(request, pair)}</li>
        % endfor
    </ul>
% endif

% if ctx.recipient_assocs:
    is a donor in
    <ul>
        % for pair in ctx.recipient_assocs:
        <li>${h.link(request, pair)}</li>
        % endfor
    </ul>
% endif

${ctx.jsondata}

<%def name="sidebar()">
    ${util.language_meta()}
</%def>
