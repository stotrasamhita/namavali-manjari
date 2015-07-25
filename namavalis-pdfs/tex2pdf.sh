#!/bin/bash
find ../100 -name "*.tex" | while read fpath
do
fname=`basename $fpath`
SSURL=`echo $fname | sed 's/.tex//;s/divyasthaniya_108/Ashtottara_Shatadivyasthaniya_Namavali/;s/108/Ashtottara_Shatanamavali/'`
echo "---------------------------------------------------------------"
echo "File path         : $fpath"
jobname=`echo $fname | sed 's/.tex//'`
echo "PDF target        : $jobname.pdf"
echo "StotraSamhita URL : $SSURL"
mkdir -p `dirname $jobname`
if [[ $fpath -nt 100/$jobname.pdf ]]
then
echo Rebuilding 100/$jobname.pdf... > /dev/stderr
echo Rebuilding 100/$jobname.pdf...
cat nama-template.tex | sed "s@FPATH@$fpath@;s@SSURL@$SSURL@" > 100/$jobname.tex
latexmk -xelatex 100/$jobname.tex
mv $jobname.* 100/
else
echo PDF up-to-date.
fi
done > tex2pdf.log
