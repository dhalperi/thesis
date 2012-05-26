#!/usr/bin/env python

import sys
import os

dirs = ['../scatterplot_figure/cse-aa-090301-parsed',
        '../scatterplot_figure/expt-10-parsed',
        '../scatterplot_figure/expt-11-parsed']
rate_flags = ['4100', '4101', '4102', '4103', '4104', '4105', '4106', '4107']
rate_mbps = [6.5, 13, 19.5, 26, 39, 52, 58.5, 65]


def read_all_data():
    D = {}
    topD = {}
    for r in rate_flags:
        for d in dirs:
            fname = os.path.join(d,'data-%s' %(r,))
            try:
                inf = open(fname, "r")
            except:
                continue
            for line in inf:
                line = line.strip()
                if line[0] < '0' or line[0] > '9':
                    continue
                line = line.split()
                src = line[0]
                dst = line[1]
                txpower = int(line[2])
                prr = float(line[3])
                snr = float(line[4])
                if (src,dst,d) not in D:
                    D[(src,dst,d)] = {}
                    topD[(src,dst,d)] = {}
                if r not in D[(src,dst,d)]:
                    D[(src,dst,d)][r] = []
                D[(src,dst,d)][r].append((snr,prr))
                if txpower <= 20 and r not in topD[(src,dst,d)] or txpower <= 20 and txpower > topD[(src,dst,d)][r][2]:
                    topD[(src,dst,d)][r] = (snr,prr,txpower)
            inf.close()
    return (D,topD)

def get_thresholds(D):
    ret = {}
    for r in rate_flags:
        i = rate_flags.index(r)
        if i == 0:
            prr_thresh = 0
        else:
            prr_thresh = 100.0*rate_mbps[i-1]/rate_mbps[i]
        ret[r] = []
        for x in D:
            if r not in D[x]:
                continue
            L = D[x][r]
            L.sort()
            # Make sure this entry crosses the threshold
            if L[0][1] >= prr_thresh or L[-1][1] < prr_thresh:
                continue
            for i in range(len(L)-1):
                (snr,prr) = L[i]
                (snr2,prr2) = L[i+1]
                if prr < prr_thresh and prr2 >= prr_thresh:
                    interp = snr + (prr_thresh-prr)/(prr2-prr)*(snr2-snr)
                    ret[r].append(interp)
    return ret

def get_threshold(L, t):
    ret = [-100]
    for r in rate_flags[1:]:
        X = L[r]
        X.sort()
        N = len(X)
        ret.append(X[int(t*(N-1))])
    return ret

def get_opt(topD):
    ret = []
    for x in topD:
        opt = 0
        for (i,r) in enumerate(rate_flags):
            if r in topD[x]:
                (snr,prr,txpower) = topD[x][r]
                assert (txpower <= 20)
                if txpower != 20:
                    prr = 100
                for j in range(i):
                    if rate_flags[j] not in topD[x]:
                        topD[x][rate_flags[j]] = (snr+(20-txpower)/2,100,20)
                    opt = max(opt, rate_mbps[j])
            else:
                continue
            opt = max(opt, rate_mbps[i]*prr/100)
        ret.append(opt)
    return ret

def get_actual(topD, rssL, thresh):
    ret = []
    cnt = 0
    for (x,rss) in zip(topD,rssL):
        got = 0
#        print "Link",cnt,"x=",x,"rss=",rss,
        cnt += 1
        for (i,t) in enumerate(thresh):
            if rss < t:
                #print "stopped at i=",i
                tmp = max(0, i-1)
                r = rate_flags[tmp]
                if r in topD[x]:
                    (snr,prr,txpower) = topD[x][r]
                    assert (txpower <= 20)
                    if txpower != 20:
                        prr = 100
                    got = rate_mbps[tmp]*prr/100
                else:
                    got = 0
                break
        # Wasn't found
        if i == len(thresh)-1 and rss > thresh[-1]:
            #print "stopped at i=",i
            tmp = i
            r = rate_flags[tmp]
            if r in topD[x]:
                (snr,prr,txpower) = topD[x][r]
                assert (txpower <= 20)
                if txpower != 20:
                    prr = 100
                got = rate_mbps[tmp]*prr/100
        ret.append(got)
    return ret

def get_rss(topD):
    ret = []
    for x in topD:
        L = []
        for r in rate_flags:
            if r in topD[x]:
                (snr,prr,txpower) = topD[x][r]
                if txpower == 20:
                    L.append(snr)
                else:
                    L.append(snr + (20-txpower)/2.0)
        if len(L) == 0:
            ret.append(0)
        else:
            ret.append(sum(L)/len(L))
    return ret

if __name__ == "__main__":
    (D,topD) = read_all_data()

    L = get_thresholds(D)
    print D.keys()[0], D[D.keys()[0]]

    OPT = get_opt(topD)
    RSS = get_rss(topD)
    ACTUAL = get_actual(topD,RSS,get_threshold(L,1))
    print get_threshold(L,1)
    print zip(OPT, RSS, ACTUAL)


    for thresh in [0, 0.25, 0.5, 0.75, 1]:
        ACTUAL = get_actual(topD,RSS,get_threshold(L,thresh))
        out = open("rates-%f.dat" %(thresh), "w")
        ret = []
        for (x,z) in zip(OPT,ACTUAL):
            if x > 0:
                ret.append(z*1.0/x)
        ret.sort()
        for i in ret:
            print >>out, i
        out.close()
