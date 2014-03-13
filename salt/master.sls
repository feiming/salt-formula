{% from "salt/package-map.jinja" import pkgs with context %}

git-python:
  pkg.installed:
    - name: {{ pkgs['git-python'] }}

salt-master:
  pkg.installed:
    - name: {{ pkgs['salt-master'] }}
  file.managed:
    - name: /etc/salt/master
    - template: jinja
    - source: salt://salt/files/master
  service.running:
    - enable: True
    - watch:
      - pkg: salt-master
      - file: salt-master
