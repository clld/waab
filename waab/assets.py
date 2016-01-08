from clld.web.assets import environment
from clldutils.path import Path

import waab


environment.append_path(
    Path(waab.__file__).parent.joinpath('static').as_posix(), url='/waab:static/')
environment.load_path = list(reversed(environment.load_path))
