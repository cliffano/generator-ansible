<img align="right" src="https://raw.github.com/cliffano/generator-ansible/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/generator-ansible/workflows/CI/badge.svg)](https://github.com/cliffano/generator-ansible/actions?query=workflow%3ACI)
[![Security Status](https://snyk.io/test/github/cliffano/generator-ansible/badge.svg)](https://snyk.io/test/github/cliffano/generator-ansible)

Generator-Ansible
-----------------

Generator-Ansible is an Ansible projects generator using [Plop](https://plopjs.com/).

It provides the following components:

| Component | Description |
|-----------|-------------|
| ansible-role | Generate an Ansible Role project. |

All components are built using [Makefile](https://en.wikipedia.org/wiki/Make_(software)).

Usage
-----

Generate Ansible Role project:

    make generate-ansible-role

Both components will prompt you the following inputs:

| Prompt | Description |
|--------|-------------|
| Project ID | Used for Python package name and CLI command. |
| Project Name | Used in documentation or comments. |
| Project Description | Used in documentation or comments. |
| Author Name | The name of the project author. |
| GitHub ID | The GitHub ID of the project repo. |
