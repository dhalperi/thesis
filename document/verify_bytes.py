#!/usr/bin/env python

import sys

chars = set()
for c in range(ord('a'), ord('z')+1):
	chars.add(chr(c))
for c in range(ord('A'), ord('Z')+1):
	chars.add(chr(c))
for c in range(ord('0'), ord('9')+1):
	chars.add(chr(c))
punc = [',', '.', '[', ']', '?', '!', '/', '\\', '(', ')', '@', '#', '$', '%', '^', '&', '*', '-', '+', '_', '=', '{', '}', '"', '\'', ':', ';', '~', '`', '<', '>', '|']
white = ['\t', '\n', ' ']
for c in punc:
	chars.add(c)
for c in white:
	chars.add(c)

def verify_file(fname):
	infile = open(fname, "r")
	for line in infile:
		for c in line:
			if c not in chars:
				print hex(ord(c)), c
	infile.close()

for fname in sys.argv:
	verify_file(fname)
