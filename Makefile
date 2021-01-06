# VARIABLES

# molecule executable path
MOLECULE?=./.venv/bin/molecule
# molecule scenario driver name
MOLECULE_DRIVER?=docker
# molecule scenario name
MOLECULE_SCENARIO?=default
# molecule role name
MOLECULE_ROLE_NAME?=$(shell basename `pwd`)

install_ansible_venv:
	test -d ./.venv || python3 -m venv ./.venv
	./.venv/bin/pip install -r requirements.txt
	echo To activate python virtual environment, run command:
	echo . ./.venv/bin/activate

install_ansible_venv_3.8:
	test -d ./.venv || python3.8 -m venv ./.venv
	./.venv/bin/pip install -r requirements.txt
	echo To activate python virtual environment, run command:
	echo . ./.venv/bin/activate


molecule_init_scenario:
	test -d ./molecule/${MOLECULE_SCENARIO} || \
	${MOLECULE} init scenario --driver-name ${MOLECULE_DRIVER} --role-name ${MOLECULE_ROLE_NAME} ${MOLECULE_SCENARIO}

molecule_static_analyse:
	. ./.venv/bin/activate && \
	${MOLECULE} lint && \
	${MOLECULE} syntax

molecule_create:
	. ./.venv/bin/activate && \
	${MOLECULE} create && \
	${MOLECULE} list

molecule_verify:
	. ./.venv/bin/activate && \
	${MOLECULE} converge && \
	${MOLECULE} verify

molecule_test_default:
	. ./.venv/bin/activate && \
	${MOLECULE} test

molecule_test_docker:
	. ./.venv/bin/activate && \
	${MOLECULE} test --scenario-name docker

molecule_test: molecule_test_default molecule_test_docker

molecule_destroy:
	. ./.venv/bin/activate && \
	${MOLECULE} destroy --all
