<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "parameters" %>
<%block name="title"> - ${ctx.name}</%block>

<h2>Borrowed ${ctx.name} affixes</h2>

${request.map.render()}

<div class="row-fluid">
    <div class="span6">
${request.get_datatable('values', h.models.Value, parameter=ctx).render()}
    </div>
</div>
