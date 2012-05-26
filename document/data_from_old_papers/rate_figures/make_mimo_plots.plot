#!/usr/bin/env gnuplot

set style line 1 lt 1 lw 8 pt 2 ps 2 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 8 pt 4 linecolor rgb "#6680FF"
set style line 3 lt 3 lw 8 pt 6 linecolor rgb "#66FF98"
set style line 4 lt 4 lw 8 pt 1 ps 2 linecolor rgb "#9866FF"
set style line 5 lt 5 lw 8 pt 9 ps 1 linecolor rgb "#FF9866"
set style line 6 lt 6 lw 8 linecolor rgb "#66CDFF"
set style line 7 lt 7 lw 8 linecolor rgb "#80FF66"
set style line 8 lt 8 lw 8 linecolor rgb "#E566FF"

set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"

set term pdf color enhanced fsize 8 dashed
set output 'mimo_rate_skip.pdf'
set size 1,0.7
set key font "Helvetica,7" box center right vertical
set grid xtics ytics mytics ls 9
set xtics font "Helvetica,7"
set ytics font "Helvetica,7"
#set tics nomirror
set border lw 4

set xlabel 'Number of interpolated packets'
set ylabel 'Average delivered rate (Mbps)'
set key bottom right
set yrange [0:195]
set xrange [1:256]
set xtics font "Helvetica,7" ("1" 1, "2" 2, "4" 4, "8" 8, "16" 16, "32" 32, "64" 64, "128" 128, "256" 256)
set ytics font "Helvetica,7" 65
set mytics 2
set logscale x
#set size ratio 0.5
#set pointsize 1.5
plot 'skip_all.out' using 1:2 w lp ls 1 title 'OPT', \
	'skip_all.out' using 1:5 w lp ls 2 title 'Previous-OPT', \
	'skip_all.out' using 1:4 w lp ls 4 title 'ESNR'
set nologscale x
set xtics auto

# Zoom in on one skipped plot
set key bottom right
set xlabel 'Packet trace index (x400)'
set ylabel 'Average delivered rate (Mbps)'
set yrange [0:200]
set xrange [0:200]
set output 'mimo_skip_time.pdf'
set xtics 50
set mxtics 2
set grid xtics ytics mxtics mytics ls 9
plot 'opt.skip.004.txt' using 1:2 w l ls 1 title 'OPT', \
	'opt1.skip.004.txt' using 1:2 w l ls 2 title 'Previous-OPT', \
	'eff1.skip.004.txt' using 1:2 w l ls 4 title 'ESNR'
