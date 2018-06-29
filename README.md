# terraform-mod-fs-automation

Infrastructure for automation services Jenkins, Ansible, Terraform, Jenkins Job Builder etc.
Module will be used in Fundational Services environments on Dev/QA/Production accounts.
This module will create AWS EC2 instances/Networking infrastructure for automation services.

## Usage

To use the module add it as a source to the enviromnent repository.


### Prerequisites


```
Give examples
```

### Deployment

Module will be used in Fundational Services environments on Dev/QA/Production accounts.

As a plan module will be used per AWS account and contain all infrastructure for automation

Module will create following:
  - EC2 instance + eip + ebs (docker) + efs (jenkins): For Jenkins master node
  - EC2 instances for automation tools Ansible, Terraform, Jenkins Job Builder as a SSH agents for Jenkins master

Number of slave nodes could be managed by variable:

variable "instance_tools_count"         {default = 1}

To test the module run terraform with following params:

```
terraform plan -target=module.automation -var-file=terraform.tfvars

Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_vpc.this: Refreshing state... (ID: vpc-08e6edfc8f9958efe)
aws_subnet.public[0]: Refreshing state... (ID: subnet-0a311b2f267ea5eae)

...
...

Plan: 23 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

```

## Running the tests

For now module not covered with the tests

## Versioning

Versioning managed by remote tags (1.0->1.1 and so on)
Latest working version is last comming of master branch

## Authors

* **Vladyslav Bondarenko** - *Account* - https://github.com/visvbondarenko/
