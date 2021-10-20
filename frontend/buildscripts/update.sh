#! /bin/bash
cd ../
S3URL="s3://jade-lightfeather-app-frontend"
npm run build
aws s3 sync build $S3URL