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
	ln -s stage/ansible-role/ stage/workspace/
	cd stage/workspace/ && make ci
	rm -f stage/workspace/

.PHONY: ci clean stage deps generate-ansible-role test-ansible-role