
#!/bin/sh
##
docker run --rm \
  -v $(pwd)/playbooks:/ansible/playbooks:ro \
  -v $(pwd)/inventory:/ansible/inventory:ro \
  -v $(pwd)/artifacts:/ansible/artifacts \
  -e ANSIBLE_HOST_KEY_CHECKING=False \
  cr.yandex/crpd94094il917b0h4e2/ansible.latest \
  ansible-playbook /ansible/playbooks/backup_mikrotik.yml \
  -i /ansible/inventory/hosts.ini

