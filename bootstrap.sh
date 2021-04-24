#!/usr/bin/env bash
set -ex

sudo apt-get update
sudo apt-get install -y python3-distutils python3-pip  python3-venv

USER_HOME='/home/vag'
VENV_HOME="${USER_HOME}"/.venv

mkdir -p "${USER_HOME}"/.local/bin

python3 -m virtualenv "${VENV_HOME}"/ansible
source "${VENV_HOME}"/ansible/bin/activate
pip3 install pip -U
pip3 install ansible
deactivate
ln -s "${VENV_HOME}"/bin/ansible-playbook"${USER_HOME}"/.local/bin
