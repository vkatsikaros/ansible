# Ansible

## Laptop

```
# bootstrap ansible
bash bootstrap.sh

# run ansible 
cd laptop
ansible-playbook -i hosts tasks.yml --ask-become-pass
```
