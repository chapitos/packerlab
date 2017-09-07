#!/usr/bin/env bash
ACCESS_KEY=$1
SECRET_KEY=$2

function help {
  echo "USAGE: ${0} AWS_ACCESS_KEY AWS_SECRET_KEY MYSQL_ROOT_PWD"
  echo ""
  exit 1
}

if [[ $# != 2 ]]
then
  help
fi

#packer build -var "aws_source_ami=ami-f9619996" \
#             -var "aws_instance_type=t2.micro" \
#             -var "aws_ssh_user=ec2-user" \
#             -var "percona_version=56" \
#             -var "aws_access_key=$ACCESS_KEY" \
#             -var "aws_secret_key=$SECRET_KEY" \
#             templates/mysql_anonymizer_ami_template.json

packer build -var-file=vars/lab.json -var "aws_access_key=$ACCESS_KEY" -var "aws_secret_key=$SECRET_KEY" templates/demo_template.json

