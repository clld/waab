<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>


<h2>Pairs</h2>

${ctx.render()}
