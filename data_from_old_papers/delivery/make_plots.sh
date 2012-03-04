./make_siso.plot
./make_simo.plot
./make_mimo2.plot
./make_mimo3.plot

pdfcrop siso_rate_confusion.pdf
pdfcrop simo_rate_confusion.pdf
pdfcrop mimo2_rate_confusion.pdf
pdfcrop mimo3_rate_confusion.pdf

mv siso_rate_confusion-crop.pdf siso_rate_confusion.pdf
mv simo_rate_confusion-crop.pdf simo_rate_confusion.pdf
mv mimo2_rate_confusion-crop.pdf mimo2_rate_confusion.pdf
mv mimo3_rate_confusion-crop.pdf mimo3_rate_confusion.pdf
