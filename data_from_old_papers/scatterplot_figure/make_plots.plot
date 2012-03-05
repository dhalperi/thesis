#!/usr/bin/env gnuplot

reset
set style line 1 lt 1 lw 3 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 2 linecolor rgb "#6680FF"
set style line 3 lt 3 lw 2 linecolor rgb "#66FF98"
set style line 4 lt 4 lw 2 linecolor rgb "#9866FF"
set style line 5 lt 5 lw 2 pt 1 ps 2 linecolor rgb "#FF9866"
set style line 6 lt 6 lw 2 pt 2 ps 2 linecolor rgb "#66CDFF"
set style line 7 lt 7 lw 2 pt 4 linecolor rgb "#80FF66"
set style line 8 lt 8 lw 2 pt 6 linecolor rgb "#E566FF"

set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"

set term pdf color enhanced fsize 8 dashed
set output 'snr_prr_scatter.pdf'
set size 1,0.7
set xrange [0:35]
set yrange [0:100]
set border 3 lw 4
set key font "Helvetica,7" box vertical bottom right samplen 0
set ylabel "Packet Reception Ratio"
set xlabel "SNR (dB)"
set mxtics 5
set mytics 2
set tics nomirror
set xtics font "Helvetica,7" 5
set ytics font "Helvetica,7"
set grid xtics mxtics ytics ls 9
plot \
	'expt-11-parsed/data-4100' using 5:4 ls 1 title '6.5', \
	'expt-11-parsed/data-4103' using 5:4 ls 4 title '26', \
	'expt-11-parsed/data-4107' using 5:4 ls 8 title '65', \
	'cse-aa-090301-parsed/data-4100' using 5:4 ls 1 notitle, \
	'cse-aa-090301-parsed/data-4103' using 5:4 ls 4 notitle, \
	'cse-aa-090301-parsed/data-4107' using 5:4 ls 8 notitle, \
	'expt-10-parsed/data-4100' using 5:4 ls 1 notitle, \
	'expt-10-parsed/data-4103' using 5:4 ls 4 notitle, \
	'expt-10-parsed/data-4107' using 5:4 ls 8 notitle
