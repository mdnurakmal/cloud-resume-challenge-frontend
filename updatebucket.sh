#!/bin/bash

#check if bucket exists and not empty
gsutil -q stat gs://${$PROJECT_NUMBER}-cloud-resume-challenge-frontend-bucket/index.html

return_value=$?

if [[ $return_value == 0 ]] 
then
    echo "deleting existing FE folder"
    gsutil rm -r gs://${$PROJECT_NUMBER}-cloud-resume-challenge-frontend-bucket
fi

gsutil mb gs://${$PROJECT_NUMBER}-cloud-resume-challenge-frontend-bucket/
echo "uploading FE folder"

gsutil cp -r ./* gs://${$PROJECT_NUMBER}-cloud-resume-challenge-frontend-bucket/

#allow public acess to the bucket
gsutil iam ch allUsers:objectViewer gs://${$PROJECT_NUMBER}-cloud-resume-challenge-frontend-bucket

#set default static page for the bucket
gsutil web set -m index.html -e 404.html gs://${$PROJECT_NUMBER}-cloud-resume-challenge-frontend-bucket