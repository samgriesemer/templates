#!/usr/bin/env python3
# -*- coding: utf-8 -*- #

# primary site settings
AUTHOR = 'Sam Griesemer'
SITENAME = 'samgriesemer'
SITEURL = 'https://samgriesemer.com'
PATH = 'content'
TIMEZONE = 'America/Chicago'
DEFAULT_LANG = 'en'

# feed settings
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# theme details
THEME = 'theme'
THEME_STATIC_DIR = 'static'

# set static paths to be copied directly to output
STATIC_PATHS = ['images', 'docs', 'projects']

# enable/disable pagination (if templates use this variable)
DEFAULT_PAGINATION = False

# theme templates that are used to directly render content (unlike something like base.html)
DIRECT_TEMPLATES = ['index', 'authors', 'categories', 'tags', 'archives', 'wiki', 'blog', 'feed', 'tindex']

# templates to use pagination with, receive article variables
PAGINATED_TEMPLATES = {'index': None, 'tag': None, 'category': None, 'author': None, 'wiki': None, 'blog': None, 'feed': None, 'tindex': None}

# directories not to search for articles in 
ARTICLE_EXCLUDES = ['']

# almost certainly want this disabled
RELATIVE_URLS = False

# control how articles should be saved, and their site URLs
PATH_METADATA = '(?P<path_no_ext>.*)\..*'
ARTICLE_SAVE_AS = '{path_no_ext}.html'
ARTICLE_URL = '{path_no_ext}'
#PAGE_SAVE_AS = '{path_no_ext}.html'
#PAGE_URL = '{path_no_ext}'

# let containing content folder determine article category
USE_FOLDER_AS_CATEGORY = False

# Python-markdown extensions
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

# Pelican plugins
PLUGINS = ['pelican_katex']

# templates to be rendered directly as static pages (have direct access to theme templates)
TEMPLATE_PAGES = {
    'pages/about.html': 'about.html',
    'pages/projects.html': 'projects.html',
    'pages/research.html': 'research.html',
    'pages/projects/evolution.html': 'projects/evolution.html',
    'pages/projects/evolution-art.html': 'projects/evolution-art.html',
    'pages/projects/halton.html': 'projects/halton.html',
    'pages/projects/nn.html': 'projects/nn.html',
    'pages/projects/time-graph.html': 'projects/time-graph.html',
    'pages/projects/dashboard.html': 'projects/dashboard.html',
    'pages/projects/mcttt.html': 'projects/mcttt.html',
}

####################
# CUSTOM VARIABLES #
####################

# global nav bar links
MENUITEMS = (
    ('BLOG',     'https://lib.smgr.io'),
    ('PROJECTS', '/projects'),
    ('RESEARCH', '/research'),
    ('ABOUT',    '/about')
)
