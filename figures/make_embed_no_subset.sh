#!/bin/bash

pdfs=`ls *pdf`
for file in $pdfs
do
	echo $file
	ps2pdf -dEmbedAllFonts=true -dPDFSETTINGS=/prepress -dSubsetFonts=false $file $file.t
	mv $file.t $file
done
