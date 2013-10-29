from clld.web.maps import ParameterMap, Map, Legend
from clld.web.util.htmllib import HTML, literal

from waab import COLOR_MAP


class AffixFuntionMap(ParameterMap):
    def get_options(self):
        return {'show_labels': True}


class LanguagesMap(Map):
    def get_options(self):
        return {'show_labels': True, 'no_popup': True}

    def get_legends(self):
        values = []
        for _min, _max, color in COLOR_MAP:
            if not _max:
                label = '> %s' % (_min - 1,)
            elif not _min:
                label = '< %s' % (_max + 1,)
            else:
                label = ','.join(map(str, range(_min, _max + 1)))

            values.append(HTML.label(
                HTML.img(
                    src=self.req.static_url('waab:static/%s.png' % color),
                    height='20',
                    width='20'),
                literal(label + ' affixes'),
                style='margin-left: 1em; margin-right: 1em;'))

        yield Legend(self, 'values', values, label='Legend')


def includeme(config):
    config.register_map('parameter', AffixFuntionMap)
    config.register_map('languages', LanguagesMap)
