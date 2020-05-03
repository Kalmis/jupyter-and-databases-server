FROM jupyter/scipy-notebook:latest

RUN pip install --upgrade jupyterlab-git && \
    jupyter labextension install @jupyterlab/git --no-build && \
    jupyter lab build -y

