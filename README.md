# Terraform:

```
terraform init
vi -p main.tf terraform.tfvars variable.tf

. ./openrc.sh
terraform plan
terraform apply
```

# Ansible:

```
export ANSIBLE_NOCOWS=1
export ANSIBLE_REMOTE_USER=ubuntu
export ANSIBLE_VAULT_PASSWORD_FILE=$(pwd)/password-credentials.txt
export ANSIBLE_ROLES_PATH=$(pwd)/roles
export ANSIBLE_HOSTS=$(which terraform-inventory)

vi -p requirements.yml $(find playbooks -type f | xargs)

#./tfstate_2_inventory.py terraform.tfstate > inventory.ini

ansible --ssh-extra-args='-o StrictHostKeyChecking=no' all -m ping
ansible all -m ping

terraform-inventory --list terraform.tfstate | jq
```
