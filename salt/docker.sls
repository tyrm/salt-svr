docker-main repository:
  pkgrepo.managed:
    - humanname: Docker Repository
{% if grains['os_family'] == 'RedHat' %}
    - name: docker-main 
{% if grains['os'] == 'CentOS' or grains['os'] == 'RedHat' %}
    - baseurl: https://yum.dockerproject.org/repo/main/centos/$releasever/
{% elif grains['os'] == 'Fedora' %}
    - baseurl: https://yum.dockerproject.org/repo/main/fedora/$releasever/
{% endif %}
{% endif %}

docker-engine:
  pkg.installed:
    - require:
      - pkgrepo: docker-main repository

docker:
  service.running:
    - enable: True
    - watch:
      - pkg: docker-engine

python-pip:
  pkg.installed

docker-py:
  pip.installed:
    - require:
      - pkg: python-pip

