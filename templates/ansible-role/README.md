<img align="right" src="https://raw.github.com/{{github_id}}/{{github_repo}}/main/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/{{github_id}}/{{github_repo}}/workflows/CI/badge.svg)](https://github.com/{{github_id}}/{{github_repo}}/actions?query=workflow%3ACI)
[![Security Status](https://snyk.io/test/github/{{github_id}}/{{github_repo}}/badge.svg)](https://snyk.io/test/github/{{github_id}}/{{github_repo}})
<br/>

{{project_name}}
{{underline "-" project_name.length}}

{{project_name}} is a {{project_desc}} .

Usage
-----

Use the role in your playbook:

    - hosts: all

      vars:
        ans_reverse: true
        ans_transformation: 'upper'

      roles:
        - {{github_id}}.{{project_id}}