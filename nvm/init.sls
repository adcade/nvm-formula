{% from 'nvm/config.jinja' import base_config with context %}

{% set home = base_config('home') %}
nvm_packages:
  pkg.installed:
    - names:
      - git
      - gcc
      - g++
      - build-essential
      - libssl-dev

## Get NVM
https://github.com/creationix/nvm.git:
  git.latest:
    - rev: master
    - target: {{ home }}
    - force: True
    - require:
      - pkg: nvm_packages

nvm_profile:
  file.append:
    - name: /home/adcade_service/.profile
    - text: |
        if [ -f "{{ home }}/nvm.sh"] ; then
          source {{ home }}/nvm.sh
        fi

