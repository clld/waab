from waab import SOURCE_ID_PATTERN


def description(req, d):
    while SOURCE_ID_PATTERN.search(d):
        d = SOURCE_ID_PATTERN.sub(lambda m: req.route_url('source', id=m.group('id')), d)
    return d
