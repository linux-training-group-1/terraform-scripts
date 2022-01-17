# terraform-scripts
# Installation
Make sure to enable the Google Compute AP and Kubernetes Engine APi, so Terraform can automate the provisioning process. Initially, the developer must create a service account to provide editor access to Terraform. Thereafter, generate a key in JSON format and rename it to “credentials.json”. Then, save it in the directory of the repository.

Now, follow the below steps to install Terraform and Ansible to the operating server.

```bash
# install these packages to verify HashiCorp's digital signature, and instal the package repository
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

# adding HashiCorp's GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# adding HashiCorp Linux repository
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# install Terraform CLI
sudo apt-get update && sudo apt-get install terraform

# install Ansible
sudo apt install ansible
```
# Folder Structure
```angular2html
main.tf - Terraform execution plan
terraform.tfvars - Terraform by default identifies them as variables. Hence users should update these variables before provisioning the infrastructure.
variables.tf - variables used in the main.tf
storage - Terraform execution plan to create a new Google Cloud Storage Bucket to store the remote state.
modules - abstractions of resources to scale independently.
    elk - creates one ELK compute VM
    db - creates one SQL db VM
    app - creates a k8 cluster to deploy the web application
```

# Remote State
The Terraform state is stored in the Google Cloud Storage (GCS) Bucket to facilitate the following pros.
1. The state is shared remotely among the team, and thus, terraform does not consider individual local states. 
2. The state is now backed up in the cloud. 
3. The state is sensitive data which is now stored securely on the cloud. 
4. Versioning in the Google Cloud Storage enables for state recovery in case of accidental deletions.

First, there should exist a GCS bucket to store the remote state. Since the name of the bucket name should be unique, the project name can be prefixed to the bucket name. 
```bash
# go the storage directory and install the necessary dependencies
cd storage;
terraform init

# create a new GCS storage bucket
terraform apply

# to display the bucket's name and the url
terraform output
```
Use the output name to update the bucket name under the backend block in the main.tf of the parent directory.

Ensure that the Terraform service account has the Storage Object Admin access to the created respective GCS bucket.

# Setting up SSH Connection
Ansible requires python in the operating systems. Therefore, make sure to install it before proceeding with the next steps.

Since Ansible communicates to the GCP instances via SSH, we need to configure SSH metadata for the GCP compute engine.

```bash
# generate a SSH key for ansible.
ssh-keygen -t rsa -b 4096 -C ansible
```

Now, copy the path to the public and  private keys to the terraform.tfvars under the ssh_params variable. 
```bash
# obtain the path to the public SSH key by
readlink -f ~/.ssh/ansible.pub

# obtain the path to the private SSH key by
readlink -f ~/.ssh/ansible
```
# Executing the Plan
```bash
# initialize the terraform directory by installing the necessary dependencies.
terraform init 

# you can view the changes made to the infrastructure 
terraform plan

# apply the respective changes
terraform apply
```