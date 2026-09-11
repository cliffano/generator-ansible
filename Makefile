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

########################################
# Utility targets
########################################

GENERATOR_CONFIG ?= cobbler.yml

define set_generator_vars
$(1): GENERATOR_COMPONENT = $$(shell yq .generator.component $(2))
$(1): GENERATOR_INPUTS_PROJECT_ID = $$(shell yq .generator.inputs.project_id $(2))
$(1): GENERATOR_INPUTS_PROJECT_NAME = $$(shell yq .generator.inputs.project_name $(2))
$(1): GENERATOR_INPUTS_PROJECT_DESC = $$(shell yq .generator.inputs.project_desc $(2))
$(1): GENERATOR_INPUTS_AUTHOR_NAME = $$(shell yq .generator.inputs.author_name $(2))
$(1): GENERATOR_INPUTS_AUTHOR_EMAIL = $$(shell yq .generator.inputs.author_email $(2))
$(1): GENERATOR_INPUTS_AUTHOR_URL = $$(shell yq .generator.inputs.author_url $(2))
$(1): GENERATOR_INPUTS_GITHUB_ID = $$(shell yq .generator.inputs.github_id $(2))
$(1): GENERATOR_INPUTS_GITHUB_REPO = $$(shell yq .generator.inputs.github_repo $(2))
$(1): GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX = $$(shell yq .generator.inputs.github_token_prefix $(2))
endef

generate-ansible-role: clean-ansible-role
	node_modules/.bin/plop ansible-role

$(eval $(call set_generator_vars,generate-ansible-role-with-config,$(GENERATOR_CONFIG)))
generate-ansible-role-with-config: clean-ansible-role
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-ansible-role: clean-ansible-role
	make generate-ansible-role-with-config GENERATOR_CONFIG=examples/cobbler-ansible-role.yml
	# git init is needed for Molecule to work properly
	cd stage/ansible-role/ && git init -q && make deps ci

########################################
# ansible-role-partials targets
########################################

clean-ansible-role-partials:
	rm -rf stage/ansible-role-partials/

generate-ansible-role-partials: clean-ansible-role-partials
	node_modules/.bin/plop ansible-role-partials

$(eval $(call set_generator_vars,generate-ansible-role-partials-with-config,$(GENERATOR_CONFIG)))
generate-ansible-role-partials-with-config: clean-ansible-role-partials
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-ansible-role-partials: clean-ansible-role-partials
	make generate-ansible-role-partials-with-config GENERATOR_CONFIG=examples/cobbler-ansible-role-partials.yml

update-cobbler-to-latest:
	cd templates/ansible-role && make update-to-latest

.PHONY: ci clean clean-ansible-role clean-ansible-role-partials stage deps generate-ansible-role generate-ansible-role-with-config test-ansible-role generate-ansible-role-partials generate-ansible-role-partials-with-config test-ansible-role-partials update-cobbler-to-latest
