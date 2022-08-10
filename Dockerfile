FROM ubuntu:latest
ARG TERRAFORM_VERSION
#ENV TERRAFORM_VERSION=0.14.0
RUN scripts/terraform.sh
RUN scripts/git.sh
RUN scripts/packer.sh
CMD ["sleep", "infinity"]
