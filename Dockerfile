FROM python:3-slim
RUN apt-get update -y
RUN apt-get install -y sshpass
RUN python3 -m pip install --upgrade pip
RUN mkdir /home/ansible && useradd -d /home/ansible -s /bin/bash ansible && chown ansible:ansible /home/ansible

USER ansible
WORKDIR /work
ENV PATH=/home/ansible/.local/bin:$PATH
RUN pip3 install ansible
