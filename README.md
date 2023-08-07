# dsd-terraform-github

```bash
export TF_VAR_github_token='1234'
export TF_VAR_github_org='mygithuborg'

terraform plan ./vars/members.tfvars -var-file ./vars/repositories.tfvars -var-file ./vars/teams.tfvars
terraform plan \
  -var-file ./vars/members.tfvars \
  -var-file ./vars/repositories.tfvars \
  -var-file ./vars/teams.tfvars
```
