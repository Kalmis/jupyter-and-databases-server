# jupyter-and-databases-server

# Setting up the environment

## Set config in .env file

Copy the environment example file and fill in your values
```
cp .env.example .env
```

# Generating jupyter notebook password

Generate sha1 of the password with IPYthon, i.e. open Jupyter notebook somewhere and run the below
```
from IPython.lib.security import passwd
passwd('OlenOmena1')
```

## Copy or generate certificate files

You can use your own certificates or generate self signed certificates with comamnd below. The certificates must be named "notebook.crt" and "notebook.key" and placed in services/jupyter

```
openssl req -x509 -newkey rsa:4096 -keyout services/jupyter/notebook.key -out services/jupyter/notebook.crt -days 1825 -nodes
openssl req -x509 -newkey rsa:4096 -keyout services/mongodb/mongodb.key -out services/mongodb/mongodb.crt -days 1825 -nodes
cat services/mongodb/mongodb.crt services/mongodb/mongodb.key > services/mongodb/mongodb.pem
```