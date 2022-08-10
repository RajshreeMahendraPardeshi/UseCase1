apt-get update && \
apt-get install -y gnupg2 python3-pip sshpass git openssh-client && \
rm -rf /var/lib/apt/lists/* && \
apt-get clean

python3 -m pip install --upgrade pip cffi && \
pip install ansible==${ANSIBLE_CORE} && \
pip install mitogen==0.2.10 ansible-lint==${ANSIBLE_LINT} jmespath && \
pip install --upgrade pywinrm && \
rm -rf /root/.cache/pip

mkdir /ansible && \
mkdir -p /etc/ansible && \
echo 'localhost' > /etc/ansible/hosts

cd /ansible
ansible --version

