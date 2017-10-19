#! /usr/bin/env python

from sys import stdin

show = False

for line in stdin:
    if line.startswith("not ok"):
        show = True
    if line.startswith("ok"):
        show = False

    if show:
        print line.strip('\n')
