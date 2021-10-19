# Lightfeather Code Challenge Initial Notes
10-18-2021
Project contains a react front end and Express backend.

The objective is to deploy the front end and backend to the web.

Any code changes you need to make are fair game.

Include any scripts to ease deployment

## Next Steps
* Get the project running locally. Document any stuff you have to install.
* Manually Deploy to AWS
  * The react project probs to S3.
  * The Express backend probably to a linux EC2 instance. Docker would be rad but lets start simple.
* Automate the deployment. 
  * The front end will be easy, use the AWS CLI to push compiled code to the S3 bucket.
  * The backend will be a little more involved. Use either Cloud Formation or just AWS CLI bash scripts to automate the backend deployments.