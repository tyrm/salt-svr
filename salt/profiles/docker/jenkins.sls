docker_jenkins:
  dockerng.running:
    - name: jenkins
    - image: jenkins:latest
    - restart_policy: always
    - port_bindings:
      - 8080:8080
      - 50000:50000
    - environment:
      - JENKINS_OPTS: --prefix=/jenkins
    - binds: {{ pillar['docker']['ssd_dir'] }}/jenkins/home:/var/jenkins_home
