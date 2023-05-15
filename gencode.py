#!/usr/bin/env python3
# coding=utf-8

from requests_html import HTMLSession
import string
import re
import os
import io
import time
import json

class EmojiSplider:
    def __init__(self, dbConfig = None):
        self.base_url = 'https://typst.app/docs/reference/symbols/emoji/'

    def start_requests(self):
        with HTMLSession() as session:
            r = session.get(self.base_url)
            data = r.html.find('ul.symbol-grid li')

            print('''
#let t-cm(id) = box[
  #image(width: 1.0em, "twemoji/assets/svg/" + id + ".svg")
]

#let o-cm(id) = box[
  #image(width: 1.0em, "openmoji/color/svg/" + upper(id) + ".svg")
]

#let cm-dic = (''')

            for i in data:
                nid  = int(i.attrs['data-codepoint'])
                code = i.find('button code')[0].text

                if nid == 0x002a:
                    print(R'  "ast": ("002a-fe0f-20e3", "2a-20e3"),')
                elif nid == 0x0023:
                    print(R'  "hash": ("0023-fe0f-20e3", "23-20e3"),')
                else:
                    if nid > 0xff:
                        print(R'  "{}": "{:04x}",'.format(code, nid))
                    else:
                        print(R'  "{}": ("{:04x}", "{:02x}"),'.format(code, nid, nid))

            print(''')

#let o(id) = {
  let s = cm-dic.at(id)
  if type(s) == "array" {
    o-cm(s.at(0))
  } else {
    o-cm(s)
  }
}

#let t(id) = {
  let s = cm-dic.at(id)
  if type(s) == "array" {
    t-cm(s.at(1))
  } else {
    t-cm(s)
  }
}
''')

if __name__ == '__main__':
    splider = EmojiSplider()
    splider.start_requests()
