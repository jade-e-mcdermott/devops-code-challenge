# Lightfeather Code Challenge Initial Notes
10-18-2021
Project contains a react front end and Express backend.

The objective is to deploy the front end and backend to the web.

Any code changes you need to make are fair game.

Include any scripts to ease deployment

## Next Steps

* Manually Deploy to AWS
  * The react project probs to S3.
  * The Express backend probably to a linux EC2 instance. Docker would be rad but lets start simple.
* Automate the deployment. 
  * The front end will be easy, use the AWS CLI to push compiled code to the S3 bucket.
  * The backend will be a little more involved. Use either Cloud Formation or just AWS CLI bash scripts to automate the backend deployments.

## Working Notes
Install node and npm on my ubunut box.s
https://code2care.org/howto/install-npm-ubuntu
Done.

Run the front end.
Hmmm the instructions say to run the backend first but now I want to see what happens when the front end is running without the backend.

WOW! As predicted it compiled, runs, and fails to connect to the backend. Neat.

Ok. Lets run the backend now.
Ok. Sweet no issues there either. Guid comes up as expected.


### All initial install and run commands:
Install
```
sudo apt install nodejs
sudo apt install npm
```

run backend
```
cd backend
npm ci
npm start
```

run frontend
```
cd frontend
npm ci
npm start
```

### Deploy React front end
https://aws.plainenglish.io/deploy-react-apps-on-amazon-s3-95bb9f5870d1

Looks like I can add the S3 deploy script as a step in the package.json file as a "deploy" step.


### Deploying the backend
Maybe use AWS elastic beanstalk
https://aws.amazon.com/elasticbeanstalk/getting-started/
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-sourcebundle.html

Need to zip the code and stick in in an s3 bucket.
`sudo apt install zip`

Ok. zipped folder coppied into this s3 bucket:
s3://jade-lightfeather-app-backend/lightfeather-backend.zip
`zip lightfeather-backend.zip *`