from clld.web.maps import Map, Legend
from clld.web.util.htmllib import HTML, literal

from waab import COLOR_MAP


class LanguagesMap(Map):
    def get_options(self):
        return {'no_popup': True}

    def get_legends(self):
        values = []
        for _min, _max, color in COLOR_MAP:
            if not _max:
                label = '%s or more' % _min
            elif not _min:
                label = '%s' % _max
            else:
                label = '-'.join(map(str, [_min, _max]))

            values.append(HTML.label(
                HTML.img(
                    src=self.req.static_url('waab:static/%s.png' % color),
                    height='20',
                    width='20'),
                literal(label + ' affixes'),
                style='margin-left: 1em; margin-right: 1em;'))

        yield Legend(self, 'values', values, label='Legend')


def includeme(config):
    config.register_map('languages', LanguagesMap)
