<%inherit file="app.mako"/>
<%namespace name="util" file="util.mako"/>

<%block name="header">
<div id="header" style="padding: 10px;">
    <h1>${request.dataset.name}</h1>
</div>
</%block>

<%def name="contextnav()">
    % for name in request.registry.settings['home_comp']:
    ${util.contextnavitem(name)}
    % endfor
</%def>

<%block name="footer_citation">
    ${request.dataset.formatted_name()}
    by
    <span xmlns:cc="http://creativecommons.org/ns#"
          property="cc:attributionName"
          rel="cc:attributionURL">
        ${request.dataset.formatted_editors()}
    </span>
</%block>

${next.body()}
