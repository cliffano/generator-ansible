ci: clean stage deps test-ansible-role

clean:
	rm -rf stage/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-ansible-role:
	node_modules/.bin/plop ansible-role

test-ansible-role:
	node_modules/.bin/plop ansible-role -- \
	  --project_id "ansible_role" \
		--project_name "AnsibleRole" \
		--project_desc "A sample Ansible Role project" \
		--author_name "Pakkun" \
		--github_id "pakkunbot" \
		--github_repo "ansible-role"
	cd stage/ansible-role/ && make ci

.PHONY: ci clean stage deps generate-ansible-role test-ansible-role