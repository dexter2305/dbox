#! /bin/bash


#########################

# Script to startup dbox

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
  docker-compose up -d
  logInfo "Dbox started. Monitor logs as docker-compose logs -f dbox"
else
  logError "Environment file '$envFileName' not found. Exiting."
fi
