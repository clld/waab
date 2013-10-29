<%namespace name="util" file="../util.mako"/>

% if request.params.get('parameter'):
    ## called for the info windows on parameter maps
    <% valueset = h.DBSession.query(h.models.ValueSet).filter(h.models.ValueSet.parameter_pk == int(request.params['parameter'])).filter(h.models.ValueSet.language_pk == ctx.pk).first() %>
    <h3>${h.link(request, ctx)}</h3>
    % if valueset:
        <ul class='unstyled'>
        % for value in valueset.values:
            <li>${h.link(request, value.pair, label=value.format())}</li>
        % endfor
        </ul>
    % endif
% else:
<h3>${h.link(request, ctx)}</h3>
% endif
