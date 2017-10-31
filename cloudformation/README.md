# CloudFormation Templates for Example AWS OpsWorks Deployment

## Prerequisites

These templates require a few existing AWS resources as parameters.

* An IAM user from the current AWS account that will be given privileges to utilize KMS keys are that are created:
  * You will need to know the name of the IAM user (e.g, "pea1")
* An SNS topic which will be used by CloudWatch alarms for notifications
  * You will need the entire ARN of the topic. It does not have to be owned by the current AWS account, but if it isn't, you will need to make sure that the current AWS account is allowed to send notifications to the topic in the other AWS account.
* A Route53 hosted zone. This is required because EC2 instances in the OpsWorks Layer run Chef recipes that create, update, and delete Route53 DNS records in that hosted zone.
  * You will need to know the Hosted Zone ID (e.g, Z1K99BI3YFXQK) and the corresponding domain (e.g., mydomain.cucloud.net).
* An AWS Certificate Manager HTTPS certificate, or a certificate that has been uploaded to IAM. This certificate is attached to the ELB associated with the OpsWorks Stack/Layer.
  * You will need the ARN of the certificate.

## Templates

These templates could be more directly coupled using exports. They aren't as presented here in order to maintain flexibility. The templates should be used in the numbered order to account for those dependencies.

Most of the template take an "Application" tag parameter because the templates tag resources it creates with that tag (i.e., "Application" = "myapp"). AWS resources created by these templates are generally named using the Application tag name and/or the CloudFormation stack name.

### 30 - S3 Bucket

The [30-s3.yaml](30-s3.yaml) template creates an S3 bucket to be used for ELB logs (and other logging as you see fit).

### 40 - IAM Roles

The [40-iam-roles.yaml](40-iam-roles.yaml) template creates an IAM role and corresponding instance profile to be used by your OpsWorks instances. It requires the name of an S3 bucket since it gives access for that bucket to the role/profile.

### 50 - KMS Key

The [50-kms-key.json](50-kms-key.json) template creates a custom KMS key to be used for encrypting secrets used by the application.

At present, this example does not show how encrypted secrets are handled--that may be the focus of a future enhancement. But, there is a [encrypt.sh](../misc/encrypt.sh) script that shows how to encrypt those secrets.

### 60 - OpsWorks Stack and Layer

The [60-opsworks-stack.yaml](60-opsworks-stack.yaml) template creates an OpsWorks Stack and Layers. It leaves instance management out of the picture. See https://confluence.cornell.edu/x/pCvrF for the intended approach about managing instances within this OpsWorks stack.

This template requires a LOT of input parameters, some of which refer to resources created by CloudFormation templates run earlier. Take a look at the parameters before running the stack so you know what information to have on hand.