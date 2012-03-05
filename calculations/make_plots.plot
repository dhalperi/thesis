#!/usr/bin/env gnuplot

reset
set style line 1 lt 1 lw 8 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 8 linecolor rgb "#6680FF"
set style line 3 lt 3 lw 8 linecolor rgb "#66FF98"
set style line 4 lt 4 lw 8 linecolor rgb "#9866FF"
set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"
set term pdf color enhanced fsize 10 dashed
set grid ls 9
set output 'shannon.pdf'

set size 1,0.7
set xrange [0:1000]
set yrange [0:12]
set border lw 4
set key bottom right
set ylabel "Capacity (bps/Hz)"
set xlabel "SNR"
set ytics 2
set mytics 2
plot log(1+x)/log(2) title "Shannon-Hartley" ls 1

#############################################################
reset
set style line 1 lt 1 lw 8 linecolor rgb "#FF6680"
set style line 2 lt 2 lw 8 linecolor rgb "#6680FF"
set style line 3 lt 3 lw 8 linecolor rgb "#66FF98"
set style line 4 lt 4 lw 8 linecolor rgb "#9866FF"
set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"
set term pdf color enhanced fsize 10 dashed
set output 'snr_ber.pdf'
set xlabel "SNR (dB)"
set ylabel "Bit Error Rate"
set size 1,0.7
set xrange [-1:30]
set logscale y
set yrange[1e-10:1]
set border lw 4
set key at 8,1e-5
set ytics ("1" 1, "10^{-2}" 0.01, "10^{-4}" 0.0001, "10^{-6}" 0.000001, "10^{-8}" 0.00000001, "10^{-10}" 0.0000000001)
set grid ls 9
plot \
     'snr_ber.txt' using 1:5 w l title '64-QAM' ls 4, \
     'snr_ber.txt' using 1:4 w l title '16-QAM' ls 3, \
     'snr_ber.txt' using 1:3 w l title 'QPSK' ls 2, \
     'snr_ber.txt' using 1:2 w l title 'BPSK' ls 1

#############################################################
reset
set style line 8 lt 1 lw 8 linecolor rgb "#000000"
set style line 1 lt 2 lw 8 linecolor rgb "#FF6680"
set style line 2 lt 3 lw 8 linecolor rgb "#6680FF"
set style line 3 lt 4 lw 8 linecolor rgb "#66FF98"
set style line 4 lt 5 lw 8 linecolor rgb "#9866FF"
set style line 9 lt 2 lw 0.5 linecolor rgb "#999999"
set term pdf color enhanced fsize 10 dashed
set output 'snr_bits.pdf'
set xlabel "SNR (dB)"
set ylabel "Capacity (bps/Hz)"
set size 1,0.7
set xrange [-1:30]
set yrange[0:8]
set border lw 4
set key at 11.7,7.5 reverse Left
set grid ls 9
plot \
     log(1+10**(x/10))/log(2) title "Shannon-Hartley" ls 8, \
     'snr_bits.txt' using 1:5 w l title '64-QAM' ls 4, \
     'snr_bits.txt' using 1:4 w l title '16-QAM' ls 3, \
     'snr_bits.txt' using 1:3 w l title 'QPSK' ls 2, \
     'snr_bits.txt' using 1:2 w l title 'BPSK' ls 1
