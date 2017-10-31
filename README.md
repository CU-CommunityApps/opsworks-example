# opsworks-example

## Overview

This is an example repo that can be used directly by OpsWorks. It uses two auxiliary cookbooks (aws and opsworks-utils-cookbook) that are embedded in this repo as git submodules. It contains one custom cookbook (my-custom-cookbook) with trivial functionality that leverages the opsworks-utils-cookbook.

The CloudFormation templates in the [cloudformation](cloudformation/) directory can be used to create both the OpsWorks stack and most of the supporting AWS resources (e.g. IAM instance profile).

This repo is used as an example for a Cornell Software Development Special Interest Group presentation. See https://confluence.cornell.edu/x/pCvrF.

## Some Hints for using git

### Adding a submodule

````
git submodule add https://github.com/chef-cookbooks/aws.git
git add .
git commit -m "add aws chef cookbook"
git push
````

````
git submodule add https://github.com/CU-CommunityApps/opsworks-utils-cookbook.git
git add .
git commit -m "add cloud team opsworks cookbook"
````

### Pulling in submodules that are linked
````
git submodule update --init --recursive
````

### Updating submodules that are linked

````
# Start from project root dir.
# Change to the submodule directory.
cd <submodule_dir>

# Checkout desired branch of the submodule.
git checkout master

# Pull updates from the submodule repo.
git pull

# Get back to your project root
cd ..

# Now the submodule is updated, so commit to your repo.
git commit -am "Pulled down update to <submodule_dir>"
git push
````
