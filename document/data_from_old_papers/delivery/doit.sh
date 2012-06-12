./make_siso.plot
./make_simo.plot
./make_mimo2.plot
./make_mimo3.plot

pdfcrop siso_rate_confusion.pdf
mv siso_rate_confusion{-crop,}.pdf
pdfcrop simo_rate_confusion.pdf
mv simo_rate_confusion{-crop,}.pdf
pdfcrop mimo2_rate_confusion.pdf
mv mimo2_rate_confusion{-crop,}.pdf
pdfcrop mimo3_rate_confusion.pdf
mv mimo3_rate_confusion{-crop,}.pdf

pdfcrop siso_rate_confusion_lr.pdf
mv siso_rate_confusion_lr{-crop,}.pdf
pdfcrop simo_rate_confusion_lr.pdf
mv simo_rate_confusion_lr{-crop,}.pdf
pdfcrop mimo2_rate_confusion_lr.pdf
mv mimo2_rate_confusion_lr{-crop,}.pdf
pdfcrop mimo3_rate_confusion_lr.pdf
mv mimo3_rate_confusion_lr{-crop,}.pdf
