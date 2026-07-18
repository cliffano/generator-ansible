---
description: "Testing conventions and standard practices for Ansible role projects"
applyTo: "molecule/**/*.py"
---

# Testing Guidelines

## Test Structure

- Keep verification tests under `molecule/default/tests/`
- Use `pytest` with the `testinfra` host fixture
- Name tests after the behavior they verify

### Test Files

```text
molecule/default/tests/
  conftest.py
  test_defaults.py
```

Guidelines:

- Keep tests grouped by role behavior domain
- Keep each test file focused on one logical area

## Test Style

- Assert on observable system state such as files, packages, services, and
  file contents
- Keep tests deterministic and independent of external network access
- Prefer direct assertions over complex helper abstractions

### Naming Conventions

- **Files**: `test_<behaviour>.py`
- **Functions**: `test_<scenario>_<expected_result>`
- Prefer explicit scenario names (`test_upper_reverse_content_file_created`)

### Testinfra Pattern

Use host-based assertions for infrastructure state:

```python
content_file = host.file("/tmp/output.txt")
assert content_file.exists
assert content_file.is_file
assert content_file.mode == 0o644
```

## Test Assertions

- Check file existence, type, permissions, and content explicitly
- Verify role side effects exactly as the scenario expects them
- Keep each test focused on one behavior or output artifact

### Assertion Pattern

- Assert file attributes before asserting file contents
- Use exact string assertions for deterministic generated content
- Keep one primary expected outcome per test when possible

## Pytest Execution

### Running Tests

```bash
make test
```

For focused troubleshooting, run a specific test file:

```bash
pytest molecule/default/tests/test_defaults.py -q
```

## Running Tests

- Run the Molecule suite with `make test`
- If the generated project needs a git repository for Molecule, initialize it
  before running the test target

## Scenario Coverage Guidelines

- Cover default variable behavior
- Cover transformed output behavior and generated artifacts
- Cover idempotent second-run behavior when feasible

## CI Integration

Tests are run as part of `make ci`:

```bash
make lint
make test
```

All tests must pass before merging.

## Common Pitfalls

1. Asserting only file existence without verifying contents
2. Using non-deterministic values in expected output assertions
3. Coupling tests to internal implementation details
4. Forgetting that Molecule may require a git repository for proper execution
