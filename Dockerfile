#syntax=docker/dockerfile:1
#FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu
FROM ubuntu:latest

ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive
ENV MPLBACKEND Agg

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3 \
    python3-setuptools \
    python3-dev \
    python3-tk \
    python3-pip \
    python3-pytest \
    swig \
    cmake \
    gcc \
    wget \
    curl

RUN git clone https://github.com/AVSLab/basilisk.git

WORKDIR ./basilisk

# Getting VSCode to launch locally or use remote dev container
#RUN curl -fsSL "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o vscode.deb

#RUN dpkg -i vscode.deb

#RUN rm vscode.deb

RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install pandas numpy pytest-xdist matplotlib pillow parse==1.18.0

RUN pip3 install wheel conan==1.62.0

RUN python3 ./conanfile.py

WORKDIR ./dist3

RUN make

WORKDIR ./..

CMD echo "Container launched"
