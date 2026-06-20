<!-- BEGIN:AVATAR -->
To be populated by generator-ansible ansible-role-partials
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
To be populated by generator-ansible ansible-role-partials
<!-- END:BADGES -->

# {{project_name}}

{{project_name}} is a {{project_desc}} .

## Usage

Use the role in your playbook:

```yaml
- hosts: all

  vars:
    ans_reverse: true
    ans_transformation: 'upper'

  roles:
    - {{github_id}}.{{project_id}}
```