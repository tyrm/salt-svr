nginx container:
  dockerng.running:
    - name: nginx
    - image: nginx:latest
    - restart_policy: always
    - port_bindings:
      - 80:80
      - 443:443
    - links:
      - jenkins:jenkins
      - wordpress:wordpress
    - binds:
      - {{ pillar['docker']['ssd_dir'] }}/nginx/conf:/etc/nginx:ro
      - {{ pillar['docker']['ssd_dir'] }}/nginx/log:/var/log/nginx:rw
      - {{ pillar['docker']['ssd_dir'] }}/nginx/wwwroot:/var/lib/wwwroot:ro
      - /etc/letsencrypt:/etc/letsencrypt:ro
    - environment:
      - MYSQL_ROOT_PASSWORD: {{ pillar['mysql_password'] }}
