FROM python:3.11-slim

# Устанавливаем Ansible и зависимости
RUN apt-get update && apt-get install -y \
    openssh-client \
    rsync \
    curl \
    jq \
    --no-install-recommends && \
    pip install --no-cache-dir ansible ansible-pylibssh paramiko && \
    rm -rf /var/lib/apt/lists/* && \
    ansible-galaxy collection install community.routeros

WORKDIR /ansible
CMD ["ansible-playbook", "--version"]
