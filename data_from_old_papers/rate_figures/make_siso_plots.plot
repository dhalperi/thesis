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
set size 1,0.7
set key font "Helvetica,7" box center right vertical
set grid xtics ytics mytics mxtics ls 9
set xtics font "Helvetica,7"
set ytics font "Helvetica,7"
#set tics nomirror
set border lw 4


# First graph: rate just esnr
set key top center
set xlabel 'Packet trace index (x100)'
set ylabel 'Average delivered rate (Mbps)'
set output 'siso_rate_time_opt_eff.pdf'
set yrange [0:65]
set ytics 13
set mytics 2
set xtics 50
set mxtics 2
set xrange [0:270]
set border lw 4
plot 'opt_siso_ewma.txt' using 1:2 w l ls 1 title 'OPT', \
	'opt1_siso_ewma.txt' using 1:2 w l ls 2 title 'Previous-OPT', \
	'eff1_siso_ewma.txt' using 1:2 w l ls 4 title 'ESNR'

# Second graph: rate all
set xlabel 'Packet trace index (x100)'
set ylabel 'Average delivered rate (Mbps)'
set output 'siso_rate_time_opt_eff_sr_so.pdf'
set yrange [0:65]
set xrange [0:270]
set key top center
plot   'eff1_siso_ewma.txt' using 1:2 w l ls 1 title 'ESNR', \
      	'sr_siso_ewma.txt' using 1:2 w l ls 2 title 'SampleRate', \
	'soft_siso_ewma.txt' using 1:2 w l ls 3 title 'SoftRate', \
	'sr_nf_siso_ewma.txt' using 1:2 w l ls 4 title 'SampleRate fixed'


# Third graph: skip just esnr
set xlabel 'Number of interpolated packets'
set ylabel 'Average delivered rate (Mbps)'
set key bottom left
set yrange [0:40]
set xrange [1:128]
set ytics 10
set mytics 2
set xtics ("1" 1, "2" 2, "4" 4, "8" 8, "16" 16, "32" 32, "64" 64, "128" 128)
set log x
set output 'siso_rate_skip_opt_eff.pdf'
#set size ratio 0.5
#set pointsize 1.5
plot 'skip_all_siso.out' using 1:2 w lp ls 1 title 'OPT', \
	'skip_all_siso.out' using 1:5 w lp ls 2 title 'Previous-OPT', \
	'skip_all_siso.out' using 1:4 w lp ls 4 title 'ESNR'
set nolog x
set xtics auto


# Fourth graph: skip all
set xlabel 'Number of interpolated packets'
set ylabel 'Average delivered rate (Mbps)'
set key bottom left
set yrange [0:40]
set xrange [1:128]
set xtics ("1" 1, "2" 2, "4" 4, "8" 8, "16" 16, "32" 32, "64" 64, "128" 128)
set log x
set output 'siso_rate_skip_opt_eff_sr_so.pdf'
plot 'skip_all_siso.out' using 1:2 w lp ls 1 title 'OPT', \
	'skip_all_siso.out' using 1:4 w lp ls 2 title 'ESNR', \
	'skip_all_siso.out' using 1:6 w lp ls 3 title 'SampleRate', \
	'skip_all_siso.out' using 1:8 w lp ls 4 title 'SoftRate', \
	'skip_all_siso.out' using 1:7 w lp ls 5 title 'SampleRate fixed'
