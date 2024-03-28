# syntax=docker/dockerfile:1
FROM ubuntu:latest

ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3 \
    python3-setuptools \
    python3-dev \
    python3-tk \
    python3-pip \
    python3.10-venv \
    python3-pytest \
    swig \
    cmake \
    gcc

RUN git clone https://github.com/AVSLab/basilisk.git

WORKDIR /basilisk

RUN python3 -m pip install --upgrade pip && \
    pip install pandas numpy pytest

RUN python3 -m pip install wheel conan==1.62.0

RUN python3 ./conanfile.py

CMD ["python3", "./run_all_test.py"]
