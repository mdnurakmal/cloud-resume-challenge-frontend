#!/bin/bash

#check if bucket exists and not empty
gsutil -q stat gs://cloud-resume-challenge-frontend-bucket/index.html

return_value=$?

if [[ $return_value == 0 ]] 
then
    echo "deleting existing FE folder"
    gsutil rm -r gs://cloud-resume-challenge-frontend-bucket
fi

gsutil mb gs://cloud-resume-challenge-frontend-bucket/
echo "uploading FE folder"

gsutil cp -r FE/* gs://cloud-resume-challenge-frontend-bucket/

#allow public acess to the bucket
gsutil iam ch allUsers:objectViewer gs://cloud-resume-challenge-frontend-bucket

#set default static page for the bucket
gsutil web set -m index.html -e 404.html gs://cloud-resume-challenge-frontend-bucket