#!/usr/bin/env gnuplot

reset
set style line 1 lt 1 lw 8 pt 1 ps 2 linecolor rgb "#FF6680"
set style line 2 lt 1 lw 8 pt 2 ps 2 linecolor rgb "#6680FF"
set style line 3 lt 1 lw 8 pt 4 linecolor rgb "#66FF98"
set style line 4 lt 1 lw 8 pt 6 linecolor rgb "#9866FF"
set style line 5 lt 1 lw 8 pt 1 ps 2 linecolor rgb "#FF9866"
set style line 6 lt 1 lw 8 pt 2 ps 2 linecolor rgb "#66CDFF"
set style line 7 lt 2 lw 8 pt 4 linecolor rgb "#000000"
#set style line 8 lt 8 lw 8 pt 6 linecolor rgb "#E566FF"

set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"

set term pdf color enhanced fsize 8 dashed
set output 'eff_vs_snr_qpsk.pdf'
set size 1,0.7
set xrange [0:30]
set yrange [0:10]
set border lw 4
set nokey
set xlabel "Packet SNR (dB)"
set ylabel "Effective SNR (dB)"
set xtics font "Helvetica,7" 5
set ytics font "Helvetica,7" 1
set mxtics 5
set nomytics
set grid xtics ytics ls 9
plot \
'eff_vs_snr.txt' using 1:2 ls 1 w l notitle, \
'' using 1:3 ls 2 w l notitle, \
'' using 1:4 ls 3 w l notitle, \
'' using 1:5 ls 4 w l notitle, \
'' using 1:6 ls 5 w l notitle, \
'' using 1:7 ls 6 w l notitle, \
'' using 1:(4) ls 7 w l, \
'' using 1:(8) ls 7 w l

set size 0.8,0.7
set output 'eff_vs_snr_qpsk_fortalk.pdf'
set ytics 2
replot
