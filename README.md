# Overview
This repository contains a React frontend, and an Express backend that the frontend connects to.

# Objective
Deploy the frontend and backend to somewhere publicly accessible over the internet. The AWS Free Tier should be more than sufficient to run this project, but you may use any platform and tooling you'd like for your solution.

Fork this repo as a base. You may change any code in this repository to suit the infrastructure you build in this code challenge.

# Submission
1. A github repo that has been forked from this repo with all your code.
2. Modify this README file with instructions for:
* Any tools needed to deploy your infrastructure
* All the steps needed to repeat your deployment process
* URLs to the your deployed frontend.
# URLS
## Front End
http://jade-lightfeather-app-frontend.s3-website-us-west-2.amazonaws.com
## Back End
http://lightfeather-backend.eba-76pas3ki.us-west-2.elasticbeanstalk.com/


# Deployment Tools and Setup
To re-create this environment on an Ubuntu machine you will need:
* AWS CLI
* AWS Elastic Beanstalk CL I (Its installed separately)

Once you have those tools installed, you will need to perform the following steps on your first deployment:
* Create an AWS S3 bucket configured for use as a static website.
* Create an Elastic Beanstalk Application and Environment (Scripts for this included)

Future deployments can be managed by the Deploy scripts mentioned below under "Deployment Scripts"

## Setup AWS CLI:
The first part of this guide is a decent overview on setting up the AWS cli:
https://aws.plainenglish.io/deploy-react-apps-on-amazon-s3-95bb9f5870d1

NOTE, instead of using brew to install the awscli package, on Ubuntu you will use
`sudo apt-get install awscli`

## Setup Elastic Beanstalk CLI
The Elastic Beanstalk CLI needs to be installed separately. There are instructions here: 
https://github.com/aws/aws-elastic-beanstalk-cli-setup

I also scripted the installation, you can run:
`./installElasticBeanstalkCli.sh` to automatically run all the install steps. It will need sudo to install dependencies.
Afterwards, you will have to modify your path to add "eb", and set "python" to the version of python ElasticBeanstalkCli wants. The following command (with the dot) with export the environment variables to your current shell.
`. exportEnvVars.sh`

## Create S3 Bucket to Serve the React App
I used these instructions as a quick refresher. They are detailed enough to set this up if you have never done this before.
https://www.newline.co/fullstack-react/articles/deploying-a-react-app-to-s3/
Afterwards, update the script at frontend/buildscripts/update.sh. Update the variable "S3URL" with your new s3 url.
Then, run the update script to build the react app and sync to the S3 bucket
`./update.sh`

## Create an Elastic Beanstalk Application and Environment
Before you can deploy the Express app to Elastic Beanstalk, you will have to create the initial repo, app, and environment. I used the guide below, and wrote some scripts.

https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_nodejs_express.html

First, run this command to configure the Elastic Beanstalk repo on disk.
`./createEBRepo.sh`
Then, run this command to create the Elastic Beanstalk Environment and Application
`./createEBEnv.sh `

Then, you can run the initial update by running
`./update.sh`


# Deployment Scripts
To deploy code after initial infrastructure is deployed, run these scripts.
## Front End
Run `./frontend/buildscripts/update.sh`
## Back End
Run `./backend/buildscripts/update.sh`

# Evaluation
You will be evaluated on the ease to replicate your infrastructure. This is a combination of quality of the instructions, as well as any scripts to automate the overall setup process.

# Setup your environment
Install nodejs. Binaries and installers can be found on nodejs.org.
https://nodejs.org/en/download/

For macOS or Linux, Nodejs can usually be found in your preferred package manager.
https://nodejs.org/en/download/package-manager/

Depending on the Linux distribution, the Node Package Manager `npm` may need to be installed separately.

# Running the project
The backend and the frontend will need to run on separate processes. The backend should be started first.
```
cd backend
npm ci
npm start
```
The backend should response to a GET request on `localhost:8080`.

With the backend started, the frontend can be started.
```
cd frontend
npm ci
npm start
```
The frontend can be accessed at `localhost:3000`. If the frontend successfully connects to the backend, a message saying "SUCCESS" followed by a guid should be displayed on the screen.  If the connection failed, an error message will be displayed on the screen.

# Configuration
The frontend has a configuration file at `frontend/src/config.js` that defines the URL to call the backend. This URL is used on `frontend/src/App.js#12`, where the front end will make the GET call during the initial load of the page.

The backend has a configuration file at `backend/config.js` that defines the host that the frontend will be calling from. This URL is used in the `Access-Control-Allow-Origin` CORS header, read in `backend/index.js#14`

# Optional Extras
The core requirement for this challenge is to get the provided application up and running for consumption over the public internet. That being said, there are some opportunities in this code challenge to demonstrate your skill sets that are above and beyond the core requirement.

A few examples of extras for this coding challenge:
1. Dockerizing the application
2. Scripts to set up the infrastructure
3. Providing a pipeline for the application deployment
4. Running the application in a serverless environment

This is not an exhaustive list of extra features that could be added to this code challenge. At the end of the day, this section is for you to demonstrate any skills you want to show that’s not captured in the core requirement.
