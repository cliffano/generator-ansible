ci: clean stage deps test-ansible-role

clean:
	rm -rf stage/

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
		--github_repo "ansible-role"
	cd stage && ln -s ansible-role/ workspace
	cd stage/workspace && make ci
	rm -f stage/workspace

.PHONY: ci clean clean-ansible-role stage deps generate-ansible-role test-ansible-role