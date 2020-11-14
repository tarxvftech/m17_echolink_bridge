#!/bin/bash
pip install --upgrade m17[codec2]
svxlink &
while [ 1 ]; do
	python -m m17.apps m17_to_echolink 17010 
	sleep 1s;
done
