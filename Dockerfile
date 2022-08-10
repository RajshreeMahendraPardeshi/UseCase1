FROM ubuntu:latest
ARG TERRAFORM_VERSION
#ENV TERRAFORM_VERSION=0.14.0
RUN ./terraform.sh
RUN ./scripts/git.sh
RUN ./scripts/packer.sh
CMD ["sleep", "infinity"]
