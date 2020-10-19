
#! /bin/bash


#########################

# Script to shutdown dbox

#########################

envFileName="run.env"
applicationDirName="app"


function logError(){
  message=$1
  echo "error - $message"  
}

function logInfo(){
  message=$1
  echo "info - $message"
}

if [[ -f "${envFileName}" ]]; then
  logInfo "Environment file found '$envFileName'."
  . $envFileName
  if [[ ! -d "$applicationDirName" ]]; then 
    logInfo "Creating application directory '${applicationDirName}. Do not delete this folder manually unless you know what you are doing.'"
    mkdir "$applicationDirName"
  fi
  echo "info - Shutting dbox down."
  echo "info - Persistant data remains."
  docker-compose down
  echo "info - Shutdown complete."
else
  logError "Environment file '$envFileName' not found. Exiting."
fi