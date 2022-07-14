#!/bin/bash

# Author:rrodriguez 

# Get date in yyyy-mm-dd format
todays_date=$(date '+%Y-%m-%d')
file_extension=.log

# get each service log and write it to output with todays date
docker service logs ct_api > ct_api$todays_date$file_extension
docker service logs ct_auth > ct_auth$todays_date$file_extension
docker service logs ct_samson > ct_samson$todays_date$file_extension
docker service logs ct_sched > ct_sched$todays_date$file_extension









