./make_plots.plot

pdfcrop rate_configs.pdf
mv rate_configs{-crop,}.pdf
pdfcrop rate_configs_talk.pdf
mv rate_configs_talk{-crop,}.pdf
