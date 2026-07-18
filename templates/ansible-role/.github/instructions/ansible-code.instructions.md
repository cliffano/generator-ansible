---
description: "Code conventions and standard practices for Ansible projects"
applyTo: "tasks/**/*.yml,defaults/**/*.yml,vars/**/*.yml,meta/**/*.yml,molecule/**/*.yml,examples/**/*.yml,examples/**/*.yaml,cobbler.yml"
---

# Ansible Code Guidelines

## Style & Formatting

### YAML Linting

All YAML files must pass `yamllint`:

```bash
make lint
```

Guidelines:

- Use two-space indentation in YAML files
- Keep task lists and mappings easy to scan
- Quote strings when they contain Jinja expressions or special characters
- Prefer explicit keys and readable task names

### Ansible Lint

All Ansible content must pass `ansible-lint`:

```bash
make lint
```

Guidelines:

- Fix lint issues at the source rather than suppressing rules
- Keep task names explicit for easier troubleshooting
- Prefer module parameters over shell invocations when possible

## Ansible Conventions

- Use fully qualified collection names such as `ansible.builtin.copy`
- Keep tasks idempotent
- Prefer clear, descriptive `name` fields for every task
- Store role defaults in `defaults/main.yml`
- Store role overrides in `vars/main.yml`
- Keep `meta/main.yml` minimal and accurate

### Idempotency and Safety

- Avoid tasks that change state on every run
- Use explicit file modes when writing files
- Use `changed_when` only when default behavior is not accurate
- Avoid shell commands for operations already covered by Ansible modules

### Variables and Templating

- Keep role variables consistently named (for example `ans_*` prefix)
- Put user-overridable values in `defaults/main.yml`
- Reserve `vars/main.yml` for fixed role internals
- Keep Jinja expressions readable and minimal inside YAML values

### Naming Conventions

- **Role variables**: `snake_case` (for example `ans_transformation`)
- **Task names**: imperative, action-oriented phrases
- **Files**: standard role paths (`main.yml` under each role directory)

## File Organization

Typical generated role layout:

```text
role/
├── defaults/main.yml
├── vars/main.yml
├── tasks/main.yml
├── meta/main.yml
├── molecule/default/
└── examples/
```

Guidelines:

- Keep role behavior in `tasks/main.yml`
- Keep dependency and role metadata in `meta/main.yml`
- Keep realistic usage examples in `examples/`

## Molecule and Examples

- Keep Molecule scenario files deterministic and easy to understand
- Use `converge.yml` for role application and `tests/` for verification logic
- Keep example playbooks simple and representative

### Molecule Conventions

- Keep scenario setup focused on one role behavior set
- Keep converge playbooks minimal and explicit
- Ensure scenario tests verify observable end state, not internals

## Error Handling

- Prefer module-level validation and clear task naming over hidden failures
- Fail early when required variables are missing
- Keep role outputs predictable across repeated runs

## Validation

- Treat `ansible-lint` and `yamllint` errors as build failures
- When changing role behavior, update both the Molecule scenario and the
  example playbooks if needed
- Keep role README usage aligned with default variable definitions
