<!-- BEGIN:AVATAR -->
![Avatar](avatar.jpg)
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
[![Build Status](https://github.com/cliffano/generator-ansible/workflows/CI/badge.svg)](https://github.com/cliffano/generator-ansible/actions?query=workflow%3ACI)
[![Code Scanning Status](https://github.com/cliffano/generator-ansible/workflows/CodeQL/badge.svg)](https://github.com/cliffano/generator-ansible/actions?query=workflow%3ACodeQL)
[![Security Status](https://snyk.io/test/github/cliffano/generator-ansible/badge.svg)](https://snyk.io/test/github/cliffano/generator-ansible)
<!-- END:BADGES -->

# Generator-Ansible

Generator-Ansible is an Ansible projects generator using [Plop](https://plopjs.com/).

It provides the following components:

| Component | Description |
|-----------|-------------|
| ansible-role | Generate an Ansible Role project. |
| ansible-role-partials | Generate README partial snippets for Ansible Role projects. |

All components are built using [Makefile](https://en.wikipedia.org/wiki/Make_(software)).

## Usage

Generate Ansible Role project:

```shell
make generate-ansible-role
```

Generate Ansible Role partial snippets:

```shell
make generate-ansible-role-partials
```

Both components will prompt you the following inputs:

| Prompt | Description |
|--------|-------------|
| Project ID | Used for Ansible Role name. |
| Project Name | Used in documentation or comments. |
| Project Description | Used in documentation or comments. |
| Author Name | The name of the project author. |
| Author Email | The email of the project author. |
| GitHub ID | The GitHub ID of the project repo. |
| GitHub Repository | The GitHub repository name. |
| GitHub Actions token prefix | Prefix for the GitHub token secret used in GitHub Actions workflows. |

## Usage With Config File

Each component also has a `-with-config` target that skips the interactive prompts by reading the inputs from a Cobbler YAML config file. See [examples/](examples/) for sample config files for each component.

Pass the config file path via the `GENERATOR_CONFIG` variable, it defaults to `cobbler.yml`:

```shell
make generate-ansible-role-with-config GENERATOR_CONFIG=path/to/cobbler.yml
make generate-ansible-role-partials-with-config GENERATOR_CONFIG=path/to/cobbler.yml
```

## Colophon

<!-- BEGIN:DEVELOPERS_GUIDE -->
[Developer's Guide](https://cliffano.github.io/developers-guide-makefile.html)
<!-- END:DEVELOPERS_GUIDE -->

<!-- BEGIN:BUILD_REPORTS -->
Build reports:

<!-- END:BUILD_REPORTS -->

Related Projects:

* [Cobbler](https://github.com/cliffano/cobbler) - Makefile for building Ansible roles
