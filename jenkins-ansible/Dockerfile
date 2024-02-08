FROM jenkins/jenkins

#to run cmds as root; jenkins image uses jenkins user by default
USER root

#jenkins image dont have python installed
RUN apt -qq update && \
    apt -qq -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev \
    libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev && \
    apt install python -y

RUN curl -O "https://bootstrap.pypa.io/pip/2.7/get-pip.py" && \
    python get-pip.py && \
    pip install ansible --upgrade

# wont work as hosts file is docker managed, rewrited on each layer!!
# RUN sed -i 's/^127.0.0.1.*/& jenkins.local/' /etc/hosts

#switch back to jenkins user!!
USER jenkins