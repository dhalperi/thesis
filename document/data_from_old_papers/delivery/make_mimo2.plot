#!/usr/bin/env gnuplot

reset
set style line 1 lt 1 lw 8 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 8 linecolor rgb "#6680FF"
set style line 3 lt 1 lw 8 linecolor rgb "#66FF98"
set style line 4 lt 2 lw 8 linecolor rgb "#9866FF"
set style line 5 lt 5 lw 8 pt 1 ps 2 linecolor rgb "#FF9866"
set style line 6 lt 6 lw 8 pt 2 ps 2 linecolor rgb "#66CDFF"
set style line 7 lt 7 lw 8 pt 4 linecolor rgb "#80FF66"
set style line 8 lt 8 lw 8 pt 6 linecolor rgb "#E566FF"

set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"

set term pdf color enhanced fsize 8 dashed
set output "mimo2_rate_confusion.pdf"

set size 0.8,0.5
set xrange [0:50]
set yrange [0:8]
set key font "Helvetica,7" box vertical bottom right
set tics nomirror
set border 3 lw 4
set mxtics 2
set grid xtics mxtics ytics mytics ls 9
set xtics font "Helvetica,7" 10
set ytics font "Helvetica,7" ("    0" 0, "13" 1, "26" 2, "39" 3, "52" 4, \
			      "78" 5, "104" 6, "117" 7, "130" 8)
set ylabel "MIMO2 Bitrate"

set multiplot
set xlabel "Effective SNR (dB)"
set origin 0,0
plot \
	'data/eff_opt2_maxmin_rate_2x3_90.octave' using 1:2 w l ls 3 title 'Best Link', \
	'' using 1:3 w l ls 4 title 'Worst Link'

set xlabel "Packet SNR (dB)"
set origin 0,0.5
plot \
	'data/rssi_opt2_maxmin_rate_2x3_90.octave' using 1:2 w l ls 1 title 'Best Link', \
	'' using 1:3 w l ls 2 title 'Worst Link'
set nomultiplot

###################
set output "mimo2_rate_confusion_lr.pdf"

set size 0.48,0.5
set xrange [0:50]
set yrange [0:8]
set key font "Helvetica,7" box vertical bottom right width -1.5 samplen 1
set tics nomirror
set border 3 lw 4
set mxtics 2
set grid xtics mxtics ytics mytics ls 9
set xtics font "Helvetica,7" 10
set ytics font "Helvetica,7" ("    0" 0, "13" 1, "26" 2, "39" 3, "52" 4, \
			      "78" 5, "104" 6, "117" 7, "130" 8)
set ylabel "MIMO2 Bitrate"

set multiplot
set xlabel "Effective SNR (dB)"
set origin 0.5,0
plot \
	'data/eff_opt2_maxmin_rate_2x3_90.octave' using 1:2 w l ls 3 title 'Best Link', \
	'' using 1:3 w l ls 4 title 'Worst Link'

set xlabel "Packet SNR (dB)"
set origin 0,0
plot \
	'data/rssi_opt2_maxmin_rate_2x3_90.octave' using 1:2 w l ls 1 title 'Best Link', \
	'' using 1:3 w l ls 2 title 'Worst Link'
set nomultiplot
