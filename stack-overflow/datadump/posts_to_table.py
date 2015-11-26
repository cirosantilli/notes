#!/usr/bin/env python

"""
Convert Posts.xml to a simple space separated text file.

Can only contain fields which don't contain spaces, but this basically equals all the interesting fields.
"""

import os.path
import sys
import xml.parsers.expat

attrs_keep = [
    'Id',
    'PostTypeId',
    'ParentId',
    'Score',
    'ViewCount',
    'OwnerUserId',
    'Tags',
]
column_separator = ','
row_separator = '\n'
xml_path = 'Posts.xml'

class Parser:

    def __init__(self):
        self._output = ''
        self._parser = xml.parsers.expat.ParserCreate()
        self._parser.StartElementHandler  = self.tagOpen

    def feed(self, file):
        self._parser.ParseFile(file)

    def output(self):
        return self._output

    def tagOpen(self, tag, attrs):
        if tag == 'row':
            row = []
            for attr in attrs_keep:
                row.append(attrs.get(attr, ''))
            sys.stdout.write(column_separator.join(row) + row_separator)

Parser().feed(open(xml_path, 'r'))
