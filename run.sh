#!/bin/bash
pip install --upgrade m17[codec2]
svxlink &
while [ 1 ]; do
	python -m m17.apps echolink_bridge W2FBI L M17-M17 E
	sleep 1s;
done
