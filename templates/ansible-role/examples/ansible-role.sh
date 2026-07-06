#!/usr/bin/env bash
set -o errexit
set -o nounset

cd ../
. ./.venv/bin/activate
cd examples/

# NOTE: `ansible-galaxy role install <path> --force` no longer works in
# newer versions of ansible-core (2.21.1 is used).
# Instead of installing the local directory as a role, newer versions
# attempt to look it up on the Galaxy API (https://galaxy.ansible.com/api/)
# Hence we need to copy the role to a stage directory to simulate the path installation
#and install it from there.
rm -rf ../stage/test-examples/roles/{{github_id}}.{{project_id}}
mkdir -p ../stage/test-examples/roles/{{github_id}}.{{project_id}}
for dir_name in config defaults meta tasks vars; do
	mkdir -p ../stage/test-examples/roles/{{github_id}}.{{project_id}}/"${dir_name}"
	cp -R "${PWD}"/../"${dir_name}"/ ../stage/test-examples/roles/{{github_id}}.{{project_id}}/"${dir_name}"
done

ansible-playbook -i localhost, -c local playbook-direct.yaml
ansible-playbook -i localhost, -c local playbook-import.yaml
