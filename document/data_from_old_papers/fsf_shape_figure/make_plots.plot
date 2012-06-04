#!/usr/bin/env gnuplot

reset
set style line 1 lt 1 lw 8 pt 1 ps 2 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 8 pt 2 ps 2 linecolor rgb "#6680FF"
set style line 3 lt 3 lw 8 pt 4 linecolor rgb "#66FF98"
set style line 4 lt 4 lw 8 pt 6 linecolor rgb "#9866FF"
#set style line 5 lt 5 lw 8 pt 1 ps 2 linecolor rgb "#FF9866"
#set style line 6 lt 6 lw 8 pt 2 ps 2 linecolor rgb "#66CDFF"
#set style line 7 lt 7 lw 8 pt 4 linecolor rgb "#80FF66"
#set style line 8 lt 8 lw 8 pt 6 linecolor rgb "#E566FF"

set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"

set term pdf color enhanced fsize 8 dashed
set output 'fsf_shape.pdf'
set size 0.8,0.85
set xrange [-28:28]
set yrange [0:50]
set border lw 4
set key font "Helvetica,7" box top center horizontal
set xlabel "Subcarrier Index"
set ylabel "SNR (dB)"
set xtics font "Helvetica,7" 7
set ytics font "Helvetica,7"
set mxtics 7
set mytics 5
set grid xtics ytics ls 9
plot \
'fsf_shape_plottable.txt' using 1:2 ls 1 w lp title 'PRR 83%, SNR 30.2 dB', \
'fsf_shape_plottable.txt' using 1:3 ls 2 w lp title 'PRR 78%, SNR 27.1 dB', \
'fsf_shape_plottable.txt' using 1:4 ls 3 w lp title 'PRR 74%, SNR 18.2 dB', \
'fsf_shape_plottable.txt' using 1:5 ls 4 w lp title 'PRR 80%, SNR 16.5 dB'

# For talk
set size 0.8,0.7
set term pdf color enhanced fsize 14 dashed
set output 'fsf_shape_fortalk.pdf'
set key off
set yrange [0:40]
set xtics font "Helvetica,10" 14
set ytics font "Helvetica,10" 10
set noxlabel
set noylabel
plot \
	'fsf_shape_plottable.txt' using 1:2 ls 2 w lp notitle, \
	'fsf_shape_plottable.txt' using 1:5 ls 3 w lp notitle
