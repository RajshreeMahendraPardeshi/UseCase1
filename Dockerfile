FROM ubuntu:latest
ARG TERRAFORM_VERSION=0.14.0
ARG ANSIBLE_CORE=5.6.0
ARG ANSIBLE_LINT=6.0.1
COPY scripts/terraform.sh .
COPY scripts/git.sh .
COPY scripts/packer.sh .
COPY scripts/ansible.sh .
RUN ./terraform.sh
RUN ./git.sh
RUN ./packer.sh
RUN ./ansible.sh
CMD ["sleep", "infinity"]
