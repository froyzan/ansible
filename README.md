# Ansible playbook

## SSH Key Copy Script
Этот скрипт на Bash `ssh-copy/copy_ssh_keys.sh` позволяет добавлять IP-адреса удаленных серверов в файл `known_hosts` и копировать публичный SSH-ключ с помощью `ssh-copy-id`.

Создайте файл со списком серверов `server_list.txt` и добавьте в него IP-адреса или имена хостов, по одному на строку:
```text
  vim server_list.txt
  `192.168.1.100
  192.168.1.101`...
```

### Запуск
```bash
  chmod +x copy_ssh_keys.sh
  ./copy_ssh_keys.sh
```
