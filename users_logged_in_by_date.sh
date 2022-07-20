#!/bin/bash

#today=` date | awk '{print $1,$2,$3}'`

#last | grep "$today" | awk '{print $1}'

dayofweek="Mon"
month="Aug"
day="15"

last | grep -i "$dayofweek $month $day"

