#!/bin/zsh

./make_mimo_plots.plot
./make_siso_plots.plot

sleep 1
ls -l *pdf

pdfcrop mimo_rate_skip.pdf
pdfcrop mimo_skip_time.pdf
pdfcrop siso_rate_time_opt_eff.pdf
pdfcrop siso_rate_time_opt_eff_sr_so.pdf
pdfcrop siso_rate_skip_opt_eff.pdf
pdfcrop siso_rate_skip_opt_eff_sr_so.pdf

mv mimo_rate_skip{-crop,}.pdf
mv mimo_skip_time{-crop,}.pdf
mv siso_rate_time_opt_eff{-crop,}.pdf
mv siso_rate_time_opt_eff_sr_so{-crop,}.pdf
mv siso_rate_skip_opt_eff{-crop,}.pdf
mv siso_rate_skip_opt_eff_sr_so{-crop,}.pdf
