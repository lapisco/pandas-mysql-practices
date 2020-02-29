# Pandas and MySQL with Python
Pandas and MySQL with Python

## How to install the requirements to use the codes

### Install virtualenv via pip:
pip install virtualenv

### Test your installation
virtualenv --version


### Create the virtualenv for the project
virtualenv .env -p python3

### To begin using the virtual environment, it needs to be activated:
. .env/bin/activate

### Intall the packages
pip install -r requirements.txt


## How to use jupyter notebook
deactivate 

pip3 install ipykernel

python3 -m ipykernel install --name .env --user  --display-name "env_data"

jupyter notebook

