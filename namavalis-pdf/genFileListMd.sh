#!/bin/bash
find | grep pdf$ | awk -F '/' '
BEGIN{lastnum=0; titles[100]="###Shata Namavalis"; titles[1000]="###Sahasra Namavalis"; titles[300]="###Trishati Namavalis"; print "## Namavalis"}
{	
	number=$2
	if (number!=lastnum)
		{
			print "\n\n" titles[number]
			lastnum = number
		}
	deityName=$3
	sub(/.pdf/,"",deityName)
	gsub(/_/," ",deityName)
	gsub(/[A-Z]/," &",deityName)
	print ("*" deityName, "[A5 PDF](https://github.com/stotrasamhita/namavali-manjari/raw/master/namavalis-pdf/" $2 "/" $3 ")", "[Kindle PDF](https://github.com/stotrasamhita/namavali-manjari/raw/master/namavalis-kindle-pdf/" $2 "/" $3 ")")
}'

