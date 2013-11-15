<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "pairs" %>

<h2>${ctx.name}</h2>

${util.dl_table(('Genus', ctx.jsondatadict['genus']), ('Area', ctx.jsondatadict['macroarea']))}

<% attrs = ['donor', 'recipient'] %>
% for i, attr in enumerate(attrs):
    % if getattr(ctx, attr + '_assocs'):
    is a ${attrs[0] if i else attrs[1]} for
    <ul>
        % for pair in getattr(ctx, attr + '_assocs'):
        <li>${h.link(request, pair)}</li>
        % endfor
    </ul>
    % endif
% endfor

<%def name="sidebar()">
    ${util.codes()}
    <div style="clear: right;"> </div>
    % if ctx.latitude is not None:
    <%util:well>
        ${request.map.render()}
        ${h.format_coordinates(ctx, wgs_link=False)}
    </%util:well>
    % endif
</%def>
