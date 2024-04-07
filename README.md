# Packer

#Installations:
https://developer.hashicorp.com/packer/downloads?product_intent=packer

# Commands
To init:
packer init <packer template file>
e.g. packer init packer-main.hcl

To validate packer template:
packer validate <packer template file>
e.g. packer validate packer-main.hcl

To start image build:
packer build <packer template file>
e.g. packer build packer-main.hcl

To pass aws variable as params:
packer -var "aws_access_key=$AWS_ACCESS_KEY" -var "aws_secret_key=$AWS_SECRET_KEY"
