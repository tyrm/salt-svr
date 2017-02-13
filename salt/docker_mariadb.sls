pg_axiom:
  dockerng.running:
    - name: mariadb
    - image: mariadb:latest
    - port_bindings: 3306:3306
    - binds: {{ pillar['docker']['ssd_dir'] }}/mysql/data:/var/lib/mysql
    - environment:
      - MYSQL_ROOT_PASSWORD: {{ pillar['mysql_password'] }}
