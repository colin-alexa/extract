#! /usr/bin/env python

from sys import stdin

show = false

for line in stdin:
    if line.startsWith("not ok"):
        show = True
    if line.startsWith("ok"):
        show = False

    if show:
        print line
