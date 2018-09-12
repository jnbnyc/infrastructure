the group_vars symlink in this folder is required to resolve variables correctly
at the present time Ansible 2.5.5 does not present us with an option to configure
the location of the group_vars directory

Further Clarification

the command ansible-playbook is expecting the group_vars directory to be in the same
directory as the playbook yml
