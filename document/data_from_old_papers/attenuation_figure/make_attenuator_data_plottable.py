#!/usr/bin/env python

import sys

assert(len(sys.argv) == 2)

f = open(sys.argv[1], "r")

d = {}
for line in f:
    line  = line.strip().split()
    fname = line[0]
    prr = float(line[3])
    snr_a = float(line[4])
    fname = fname.split('.')
    rate = fname[6]
    if rate in d:
        d[rate].append((snr_a,prr))
    else:
        d[rate] = [(snr_a,prr)]

for i in d.keys():
    out = open("atten_data.%s.txt" %(i,), "w")
    L = d[i]
    L.sort()
    for (snr,prr) in L:
        print >>out, snr,prr
    out.close()
