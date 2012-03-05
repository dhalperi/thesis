#!/usr/bin/env gnuplot

reset
set style line 1 lt 1 lw 8 pt 1 ps 2 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 8 pt 2 ps 2 linecolor rgb "#6680FF"
set style line 3 lt 3 lw 8 pt 4 linecolor rgb "#66FF98"
set style line 4 lt 4 lw 8 pt 6 linecolor rgb "#9866FF"
set style line 5 lt 5 lw 8 pt 1 ps 2 linecolor rgb "#FF9866"
set style line 6 lt 6 lw 8 pt 2 ps 2 linecolor rgb "#66CDFF"
#set style line 7 lt 7 lw 8 pt 4 linecolor rgb "#80FF66"
#set style line 8 lt 8 lw 8 pt 6 linecolor rgb "#E566FF"

set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"

set term pdf color enhanced fsize 8 dashed
set output 'eff_snr_example.pdf'
set size 1,0.8
set xrange [-28:28]
set yrange [5:25]
set border lw 4
#set key font "Helvetica,7" box top right horizontal
set nokey
set xlabel "Subcarrier Index"
set ylabel "SNR (dB)"
set xtics font "Helvetica,7" 7
set ytics font "Helvetica,7"
set mxtics 7
set mytics 5
set grid xtics ytics ls 9
set label "Subcarrier SNRs" at -18.6,22 #textcolor rgb "#FF6680"
set label "Packet SNR" at -12.5,18.9 #textcolor rgb "#6680FF"
set label "64-QAM" at -11,16.85 #textcolor rgb "#66FF98"
set label "16-QAM" at -11,14.65 #textcolor rgb "#66FF98"
set label "QPSK" at 11,11.65 #textcolor rgb "#66FF98"
set label "BPSK" at 11,8.75 #textcolor rgb "#66FF98"
plot \
'esnr_example_data.txt' using 1:2 ls 1 w l title 'Subcarrier SNRs', \
'esnr_example_data.txt' using 1:3 ls 2 w l title 'Packet SNR', \
'esnr_example_data.txt' using 1:7 ls 3 w l title '64-QAM', \
'esnr_example_data.txt' using 1:6 ls 4 w l title '16-QAM', \
'esnr_example_data.txt' using 1:5 ls 5 w l title 'QPSK', \
'esnr_example_data.txt' using 1:4 ls 6 w l title 'BPSK'
