#!/usr/bin/env gnuplot
reset
set style line 1 lt 1 lw 1 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 1 linecolor rgb "#6680FF"
set style line 3 lt 3 lw 1 linecolor rgb "#66FF98"
set style line 4 lt 4 lw 1 linecolor rgb "#9866FF"
set style line 5 lt 5 lw 1 linecolor rgb "#FF9866"
set style line 6 lt 6 lw 1 pt 2 ps 2 linecolor rgb "#66CDFF"
set style line 7 lt 7 lw 1 pt 4 linecolor rgb "#80FF66"
set style line 8 lt 8 lw 1 pt 6 linecolor rgb "#E566FF"

set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"

set term pdf color enhanced fsize 8 dashed
set output 'rate_configs.pdf'
set size 1,0.7
set xrange [0:500]
set yrange [0.75:5.75]
set key font "Helvetica,7" box bottom right vertical invert samplen 1
set xlabel "Data Rate (Mbps)"
set ytics font "Helvetica,7" ("SIMO" 1.35, "MIMO2/3" 2.125, "SGI" 3, "HT40" 4, "SGI+HT40" 5)
set xtics font "Helvetica,7" 50
set mxtics 2
set pointsize 1.5
set grid xtics ls 9


plot 'simo.txt' using 1:(1.35) title 'SIMO' ls 1 pt 9, \
	'mimo2.txt' using 1:(2) title 'MIMO2' ls 2 pt 7, \
	'mimo3.txt' using 1:(2.25) title ' MIMO3' ls 2 pt 5, \
	'simo_sgi.txt' using 1:(2.75) notitle ls 3 pt 9, \
	'mimo2_sgi.txt' using 1:(3) notitle ls 3 pt 7, \
	'mimo3_sgi.txt' using 1:(3.25) notitle ls 3 pt 5, \
	'simo_ht40.txt' using 1:(3.75) notitle ls 4 pt 9, \
	'mimo2_ht40.txt' using 1:(4) notitle ls 4 pt 7, \
	'mimo3_ht40.txt' using 1:(4.25) notitle ls 4 pt 5, \
	'simo_ht40_sgi.txt' using 1:(4.75) notitle ls 5 pt 9, \
	'mimo2_ht40_sgi.txt' using 1:(5) notitle ls 5 pt 7, \
	'mimo3_ht40_sgi.txt' using 1:(5.25) notitle ls 5 pt 5
