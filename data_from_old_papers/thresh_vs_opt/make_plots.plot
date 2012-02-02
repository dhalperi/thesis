#!/usr/bin/env gnuplot
reset
set style line 1 lt 1 lw 8 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 8 linecolor rgb "#6680FF"
set style line 3 lt 3 lw 8 linecolor rgb "#66FF98"
set style line 4 lt 4 lw 8 linecolor rgb "#9866FF"
set style line 5 lt 5 lw 8 linecolor rgb "#FF9866"
#set style line 6 lt 6 lw 8 pt 2 ps 2 linecolor rgb "#66CDFF"
#set style line 7 lt 7 lw 8 pt 4 linecolor rgb "#80FF66"
#set style line 8 lt 8 lw 8 pt 6 linecolor rgb "#E566FF"

set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"

set term pdf color enhanced fsize 10 dashed
set output 'thresh_vs_opt.pdf'
set size 1,0.7
set xrange [0:200]
set yrange [0:1]
set key box center right vertical
set xlabel "Fraction of Links"
set ylabel "Fraction of Optimal Rate"
set grid ls 9
set xtics ("0" 0, "0.25" 50, "0.5" 100, "0.75" 150, "1" 200)

plot 'rates-0.000000.dat' w l title '0' ls 1, \
     'rates-0.250000.dat' w l title '25' ls 2, \
     'rates-0.500000.dat' w l title '50' ls 3, \
     'rates-0.750000.dat' w l title '75' ls 4, \
     'rates-1.000000.dat' w l title ' 100' ls 5
