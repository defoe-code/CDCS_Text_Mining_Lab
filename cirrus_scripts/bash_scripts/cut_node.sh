#!/bin/bash
set -x
FILE="r1i2n31.ib0.icexa.epcc.ed.ac.uk"
echo "${FILE%%.*}"

rename=${FILE%%.*}
echo $rename



