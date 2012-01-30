#!/usr/bin/env gnuplot

reset
set style line 1 lt 1 lw 8 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 8 linecolor rgb "#6680FF"
set style line 3 lt 3 lw 8 linecolor rgb "#66FF98"
set style line 4 lt 4 lw 8 linecolor rgb "#9866FF"
set style line 5 lt 5 lw 8 pt 1 ps 2 linecolor rgb "#FF9866"
set style line 6 lt 6 lw 8 pt 2 ps 2 linecolor rgb "#66CDFF"
set style line 7 lt 7 lw 8 pt 4 linecolor rgb "#80FF66"
set style line 8 lt 8 lw 8 pt 6 linecolor rgb "#E566FF"

set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"

set term pdf color enhanced fsize 10 dashed
set output 'snr_prr_atten.pdf'
set size 1,0.7
set xrange [0:30]
set yrange [0:100]
set key box vertical bottom right spacing 0.9
set ylabel "Packet Reception Ratio"
set xlabel "SNR (dB)"
set mxtics 5
set xtics 5
set grid xtics mxtics ytics mytics ls 9
plot \
	'atten_data.0x4100.txt' w l ls 1 title '6.5', \
	'atten_data.0x4101.txt' w l ls 2 title '13', \
	'atten_data.0x4102.txt' w l ls 3 title '19.5', \
	'atten_data.0x4103.txt' w l ls 4 title '26', \
	'atten_data.0x4104.txt' w lp ls 5 title '39', \
	'atten_data.0x4105.txt' w lp ls 6 title '52', \
	'atten_data.0x4106.txt' w lp ls 7 title '58.5', \
	'atten_data.0x4107.txt' w lp ls 8 title '65'
