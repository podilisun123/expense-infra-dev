#!/bin/bash
component=$1
environment=$1
dnf install ansible -y
pip3.9 install botocore boto3
ansible-pull -i localhost -U https://github.com/podilisun123/expense-ansible-roles-tf.git -e component=$component -e env=$environment