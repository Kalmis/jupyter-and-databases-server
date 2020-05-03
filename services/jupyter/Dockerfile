FROM jupyter/scipy-notebook:latest

USER root

RUN apt-get update && apt-get install -y git-all

USER $NB_UID

RUN pip install --upgrade jupyterlab-git && \
    jupyter labextension install @jupyterlab/git --no-build && \
    jupyter lab build -y

# Required by GRANT_SUDO
USER root