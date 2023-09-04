#!/bin/bash

STS="$(aws sts assume-role --role-arn "$aws_role_arn" --role-session-name "Session1")"

export AWS_ACCESS_KEY_ID=$(jq -r ".Credentials.AccessKeyId" <<< $STS)
export AWS_ACCESS_KEY=$(jq -r ".Credentials.AccessKeyId" <<< $STS)

export AWS_SECRET_ACCESS_KEY=$(jq -r ".Credentials.SecretAccessKey" <<< $STS)
export AWS_SECRET_KEY=$(jq -r ".Credentials.SecretAccessKey" <<< $STS)

export AWS_SESSION_TOKEN=$(jq -r ".Credentials.SessionToken" <<< $STS)
export AWS_SECURITY_TOKEN=$(jq -r ".Credentials.SessionToken" <<< $STS)

if [ $1 == "upload" ]; then aws s3 cp $file s3://$bucket/$path/$file; fi
if [ $1 == "download" ]; then aws s3 cp s3://$bucket/$path/$file $file; fi
