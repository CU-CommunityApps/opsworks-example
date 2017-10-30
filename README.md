# opsworks-example

## Adding a submodule

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

## Pulling in submodules that are linked
````
git submodule update --init --recursive
````

## Updating submodules that are linked

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
