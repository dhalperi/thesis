
# First, see if the .embed_stamp file exists
if [[ ! -e .embed_stamp ]]
then
	touch -t 199001010000 .embed_stamp
	echo "does not exist"
fi

for file in `find . -name \*.pdf`
do
	if [[ $file -nt .embed_stamp ]]
	then
		echo $file
		ps2pdf -dEmbedAllFonts=true -dPDFSETTINGS=/prepress -dSubsetFonts=true $file tmpoutput.pdf
		mv tmpoutput.pdf $file
	else
		echo 'SKIP ' $file
	fi
done

touch .embed_stamp
