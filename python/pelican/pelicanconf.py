#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = 'Sam'
SITENAME = 'samgriesemer'
SITEURL = ''
PATH = 'content'

TIMEZONE = 'America/Chicago'

DEFAULT_LANG = 'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

THEME = 'theme'
THEME_STATIC_DIR = 'static'
STATIC_PATHS = ['images', 'docs', 'index'] 

# templates that all templates have direct access to
DIRECT_TEMPLATES = ['index', 'authors', 'categories', 'tags', 'archives']
ARTICLE_EXCLUDES = ['*']

DEFAULT_PAGINATION = False

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

# CUSTOM VARIABLES
# links for the site nav bar
MENUITEMS = (
    ('review', '/review'),
    ('decks',  '/decks')
)

MARKDOWN = {
    'extension_configs': {
        'markdown.extensions.codehilite': {'css_class': 'highlight'},
        'markdown.extensions.extra': {},
        'markdown.extensions.meta': {},
        'markdown.extensions.toc': {},
        'mdx_outline': {'configs': {'wrapper_cls': ''}},
    },
    'output_format': 'html5',
}

# templates to be rendered directly as static pages (these have direct access to theme templates)
TEMPLATE_PAGES = {
    'review.html': 'review.html',
    'decks.html': 'decks.html',
}
