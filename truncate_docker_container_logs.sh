#!/bin/bash

# Author:rrodriguez 
# Note: To run manually, you must run this script as root. Run script as  sudo ./archive_container_logs.sh
# Note: Under root crontab, job is listed to run on auto as #*/30 * * * * /home/ec2-user/./archive_container_logs.sh


# vars for containter log path, dir seperator, and log file extension
container_log_file_path=/var/lib/docker/containers/
container_sep=/
container_log_file_extension=-json.log

#make folder to hold container logs if needed
  if [ ! -d "/home/ec2-user/HoldDockerContainerLogs" ] 
  then
    mkdir  /home/ec2-user/HoldDockerContainerLogs
  fi
  


#get a list of all the containers in the dir
ls -l /var/lib/docker/containers/ | awk '{print $9}' > hold_docker_container_names_tmp.txt

# remove the first line in the temp file, and add continer names to file to be read as input down below.
sed '1d' hold_docker_container_names_tmp.txt > hold_docker_container_names.txt


  while read container_name_in
  
  do
    
# combine the container name with dir seperator, and the log file extension
concatenate=$container_log_file_path$container_name_in$container_sep$container_name_in$container_log_file_extension

    if [ -e $concatenate ]
    
    then 
      #log file found so copy to folder, then clear out the log file
      cp $concatenate /home/ec2-user/HoldDockerContainerLogs
      truncate -s 0 $concatenate
#    else
#      echo file not found $concatenate 
    fi 

   done < hold_docker_container_names.txt



# file clean-up
rm  hold_docker_container_names_tmp.txt
rm  hold_docker_container_names.txt


