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
https://www.newline.co/fullstack-react/articles/deploying-a-react-app-to-s3/

Looks like I can add the S3 deploy script as a step in the package.json file as a "deploy" step.

front end s3 bucket:
s3://jade-lightfeather-app-frontend

build front end command:
```
npm run build
```
aws sync command.
`aws s3 sync build s3://jade-lightfeather-app-frontend`


Serves up at: 
Frontend url:
http://jade-lightfeather-app-frontend.s3-website-us-west-2.amazonaws.com

Serves up the page the front end serves when it can't reach the backend.

Will probs want a command to create a configure an s3 bucket on demand.

### Deploying the backend
Maybe use AWS elastic beanstalk
https://aws.amazon.com/elasticbeanstalk/getting-started/
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-sourcebundle.html

Need to zip the code and stick in in an s3 bucket.
`sudo apt install zip`

Ok. zipped folder coppied into this s3 bucket:
s3://jade-lightfeather-app-backend/lightfeather-backend.zip
`zip lightfeather-backend.zip *`


Sample app url:
http://ebnodesampleapp2-env.eba-tctmevrn.us-west-2.elasticbeanstalk.com/

instructions for setting up an app with elastic beanstalk with custom code: https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_nodejs_express.html
Mkay looks like to use elastic beanstalk you have to install the elastic beanstalk cli
https://github.com/aws/aws-elastic-beanstalk-cli-setup

elb cli setup commands:
```
# download dependencies.
sudo apt-get install build-essential zlib1g-dev libssl-dev libncurses-dev libffi-dev libsqlite3-dev libreadline-dev libbz2-dev

# get installer
git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git

# run installer
./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

# Set env vars
echo 'export PATH="/home/jade/.ebcli-virtual-env/executables:$PATH"' >> ~/.bash_profile && source ~/.bash_profile

echo 'export PATH=/home/jade/.pyenv/versions/3.7.2/bin:$PATH' >> /home/jade/.bash_profile && source /home/jade/.bash_profile
```

create sample elb project commands:
```
# Create Elastic Beanstalk repo
eb init --platform node.js --region us-west-2

# Create Elastic Beanstalk env
eb create --sample node-express-env
```

test
```
eb open
```
Backend url: http://lightfeather-backend.eba-76pas3ki.us-west-2.elasticbeanstalk.com/


## Deployed URLS:
Frontend url:
http://jade-lightfeather-app-frontend.s3-website-us-west-2.amazonaws.com

Backend url: http://lightfeather-backend.eba-76pas3ki.us-west-2.elasticbeanstalk.com/



### Debugging Elastic Beanstalk deployment
from the environment logs:
address already in use: 8080

Updating:

 backend/index.js: const PORT = 8080 to const PORT = 8081
 and 
 frontend/src/config.js: export const API_URL = 'http://localhost:8080/' to export const API_URL = 'http://localhost:8081/'
 Ayyyyy it works now!


