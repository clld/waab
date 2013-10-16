from clld.web.assets import environment
from path import path

import waab


environment.append_path(
    path(waab.__file__).dirname().joinpath('static'), url='/waab:static/')
environment.load_path = list(reversed(environment.load_path))
