docker_jenkins:
  dockerng.running:
    - name: jenkins
    - image: jenkins:latest
    - port_bindings:
      - 8080:8080
      - 50000:50000
    - binds: {{ pillar['docker']['ssd_dir'] }}/jenkins/home:/var/jenkins_home
