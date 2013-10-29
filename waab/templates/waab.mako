<%inherit file="app.mako"/>

<%block name="header">
<div id="header" style="padding: 10px;">
    <h1>${request.dataset.name}</h1>
</div>
</%block>

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
