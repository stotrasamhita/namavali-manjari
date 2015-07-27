#!/bin/bash
find ../100 -name "*.tex" | while read fpath
do
fname=`basename $fpath`
SSURL=`echo $fname | sed 's/.tex//;s/divyasthaniya_108/Ashtottara_Shatadivyasthaniya_Namavali/;s/100/Shatanamavali/;s/108/Ashtottara_Shatanamavali/'`
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

find ../1000 -name "*.tex" | while read fpath
do
fname=`basename $fpath`
SSURL=`echo $fname | sed 's/.tex//;s/[A-Z]/_&/g;s/1008/Ashtottara_Sahasranamavali/;s/1000/Sahasranamavali/'| sed 's/^_//;'`
echo "---------------------------------------------------------------"
echo "File path         : $fpath"
jobname=`echo $fname | sed 's/.tex//'`
echo "PDF target        : $jobname.pdf"
echo "StotraSamhita URL : $SSURL"
mkdir -p `dirname $jobname`
if [[ $fpath -nt 1000/$jobname.pdf ]]
then
echo Rebuilding 1000/$jobname.pdf... > /dev/stderr
echo Rebuilding 1000/$jobname.pdf...
cat nama-template.tex | sed "s@FPATH@$fpath@;s@SSURL@$SSURL@" > 1000/$jobname.tex
latexmk -xelatex 1000/$jobname.tex
mv $jobname.* 1000/
else
echo PDF up-to-date.
fi
done >> tex2pdf.log

find ../300 -name "*.tex" | while read fpath
do
fname=`basename $fpath`
SSURL=`echo $fname | sed 's/.tex//;s/[A-Z]/_&/g;s/300/Trishati_Namavali/'| sed 's/^_//;'`
echo "---------------------------------------------------------------"
echo "File path         : $fpath"
jobname=`echo $fname | sed 's/.tex//'`
echo "PDF target        : $jobname.pdf"
echo "StotraSamhita URL : $SSURL"
mkdir -p `dirname $jobname`
if [[ $fpath -nt 300/$jobname.pdf ]]
then
echo Rebuilding 300/$jobname.pdf... > /dev/stderr
echo Rebuilding 300/$jobname.pdf...
cat nama-template.tex | sed "s@FPATH@$fpath@;s@SSURL@$SSURL@" > 300/$jobname.tex
latexmk -xelatex 300/$jobname.tex
mv $jobname.* 300/
else
echo PDF up-to-date.
fi
done >> tex2pdf.log
