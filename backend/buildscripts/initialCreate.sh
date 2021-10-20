#! /bin/bash
cd ../
# Create elastic beanstalk repo
eb init --platform node.js --region us-west-2

# Create Elastic Beanstalk env
eb create node-express-env-3