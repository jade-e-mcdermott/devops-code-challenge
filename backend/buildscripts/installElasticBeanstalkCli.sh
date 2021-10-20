#! /bin/bash
# download dependencies.
sudo apt-get install build-essential zlib1g-dev libssl-dev libncurses-dev libffi-dev libsqlite3-dev libreadline-dev libbz2-dev

# get installer
git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git

# run installer
./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

# Set env vars
echo 'export PATH="/home/jade/.ebcli-virtual-env/executables:$PATH"' >> ~/.bash_profile && source ~/.bash_profile

echo 'export PATH=/home/jade/.pyenv/versions/3.7.2/bin:$PATH' >> /home/jade/.bash_profile && source /home/jade/.bash_profile