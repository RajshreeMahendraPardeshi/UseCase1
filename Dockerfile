FROM ubuntu:latest
ARG TERRAFORM_VERSION=0.14.0
ARG ANSIBLE_CORE=5.6.0
ARG ANSIBLE_LINT=6.0.1
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG agent_port=50000

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT ${agent_port}
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_UC "http://updates.jenkins-ci.org"

VOLUME /data
COPY scripts/terraform.sh .
COPY scripts/git.sh .
COPY scripts/packer.sh .
COPY scripts/ansible.sh .

COPY scripts/jenkins/*  /usr/share/jenkins/ref/
COPY scripts/jenkins/init.groovy/* /usr/share/jenkins/ref/
CMD ./usr/share/jenkins/ref/jenkins_install.sh

EXPOSE 8080

RUN ./terraform.sh
RUN ./git.sh
RUN ./packer.sh
RUN ./ansible.sh
CMD ["sleep", "infinity"]
