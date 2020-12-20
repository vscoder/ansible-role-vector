ansible-role-vector
=========

This role installs and configures vector agent https://vector.dev/

Requirements
------------

None

Role Variables
--------------

See [defaults](defaults/main.yml)

Dependencies
------------

None

Example Playbook
----------------

    - hosts: all
      roles:
        - role: ansible-role-vector
          vector_configure_config:
            { vector configuration }

Makefile targets
----------------

| Target                     | Description                                                                                                                                                 |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| install_ansible_venv       | install ansible into local .venv using `python3 -m venv`                                                                                                    |
| install_ansible_virtualenv | install ansible into local .venv using `virtualenv`                                                                                                         |
| molecule_init_scenario     | create scenario named `MOLECULE_SCENARIO?=default` using driver `MOLECULE_DRIVER?=vagrant` and role name `MOLECULE_ROLE_NAME?=<current directory basename>` |
| molecule_static_analyse    | execute `molecule lint` and `molecule syntax`                                                                                                               |
| molecule_create            | create molecule instances via `molecule create`                                                                                                             |
| molecule_verify            | apply playbook to existent instance and run tests (`converge` and `verify`)                                                                                 |
| molecule_test              | run `molecule test` complex testing                                                                                                                         |
| molecule_destroy           | force destroy instances `molecule destroy -f`                                                                                                               |

License
-------

MIT

Author Information
------------------

Aleksey Koloskov aka vscoder
