./make_plots.plot

pdfcrop shannon.pdf
mv shannon{-crop,}.pdf
pdfcrop shannon_log.pdf
mv shannon_log{-crop,}.pdf
pdfcrop snr_ber.pdf
mv snr_ber{-crop,}.pdf
pdfcrop snr_bits.pdf
mv snr_bits{-crop,}.pdf
