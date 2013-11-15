<%inherit file="${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>

${next.body()}
