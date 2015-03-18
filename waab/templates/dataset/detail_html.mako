<%inherit file="../waab.mako"/>
<%namespace name="util" file="../util.mako"/>

<%def name="sidebar()">
    ${util.cite()}
</%def>

<h2>Welcome to AfBo</h2>
<p class="lead">
    AfBo comprises descriptions of 101 cases of affix borrowing, i.e. cases where one
    language borrowed at least one affix from another language, involving a total of 657
    borrowed affixes. It includes an online interface with descriptions of borrowed
    affixes in terms of their forms and functions, examples of combinations of borrowed
    affixes with native stems, search functions, maps, and over 230 bibliographical
    references. The entire database underlying AfBo can be downloaded.
</p>

<p style="font-size: larger;">
    AfBo was compiled by Frank Seifart between 2007 and 2013 with funding from the
    Max Planck Insititute for Evolutionary Anthropology's
    ${h.external_link('http://www.eva.mpg.de/linguistics/index.html', label='Department of Linguistics')},
    led by Bernard Comrie. AfBo is published as part of the
    ${h.external_link('http://clld.org', label='Cross-Linguistic Linked Data')}
    project, led by Martin Haspelmath.
</p>
<p style="font-size: larger;">
    The content of this web site, including the
    <a href="${request.route_url('download')}">downloadable database</a>,
    is  published under a
    <a rel="license" href="${request.dataset.license}">
        ${request.dataset.jsondata.get('license_name', request.dataset.license)}
    </a>.
</p>
