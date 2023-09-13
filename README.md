# dsd-terraform-github
Generate a new classic auth token, [here](https://github.com/settings/tokens)  

```bash
export TF_VAR_github_token='1234'
export TF_VAR_github_org='mygithuborg'

terraform init

terraform plan \
  -var-file ./vars/members.tfvars \
  -var-file ./vars/repositories.tfvars \
  -var-file ./vars/teams.tfvars

terraform apply \
  -var-file ./vars/members.tfvars \
  -var-file ./vars/repositories.tfvars \
  -var-file ./vars/teams.tfvars
```

Useful links:
- https://github.com/deepsouthdevs/dsd-terraform-github
- https://github.com/deepsouthdevs/dsd-terraform-github/actions
- https://github.com/orgs/deepsouthdevs-github/repositories