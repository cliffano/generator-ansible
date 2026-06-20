ci: clean stage deps test-ansible-role test-ansible-role-partials

clean:
	rm -rf stage/

########################################
# ansible-role targets
########################################

clean-ansible-role:
	rm -rf stage/ansible-role/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-ansible-role: clean-ansible-role
	node_modules/.bin/plop ansible-role

test-ansible-role:
	node_modules/.bin/plop ansible-role -- \
	  --project_id "ansible_role" \
		--project_name "AnsibleRole" \
		--project_desc "A sample Ansible Role project" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--github_id "pakkunbot" \
		--github_repo "ansible-role" \
		--github_token_prefix "STUDIO"
	# git init is needed for Molecule to work properly
	cd stage/ansible-role/ && git init -q && make ci

########################################
# ansible-role-partials targets
########################################

clean-ansible-role-partials:
	rm -rf stage/ansible-role-partials/

generate-ansible-role-partials: clean-ansible-role-partials
	node_modules/.bin/plop ansible-role-partials

test-ansible-role-partials:
	node_modules/.bin/plop ansible-role-partials -- \
	  --project_id "ansible_role" \
		--project_name "AnsibleRole" \
		--project_desc "A sample Ansible Role project" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--github_id "pakkunbot" \
		--github_repo "ansible-role" \
		--github_token_prefix "STUDIO"

update-cobbler-to-latest:
	cd templates/ansible-role && make update-to-latest

.PHONY: ci clean clean-ansible-role clean-ansible-role-partials stage deps generate-ansible-role test-ansible-role generate-ansible-role-partials test-ansible-role-partials update-cobbler-to-latest
