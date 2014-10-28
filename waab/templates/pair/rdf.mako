<%inherit file="../resource_rdf.mako"/>
<%block name="properties">
    <dcterms:source rdf:resource="${request.resource_url(ctx.donor)}"/>
    <dcterms:subject rdf:resource="${request.resource_url(ctx.recipient)}"/>
    % for source in ctx.sources:
    <dcterms:references rdf:resource="${request.resource_url(source)}"/>
    % endfor
</%block>
