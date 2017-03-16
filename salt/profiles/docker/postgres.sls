postgres container:
  dockerng.running:
    - name: postgres
    - image: postgres:latest
    - restart_policy: always
    - port_bindings: 5432:5432
    - binds:
      - {{ pillar['docker']['ssd_dir'] }}/postgres/data:/var/lib/postgresql/data
{% if pillar['docker']['hd_dir'] is defined %}
      - {{ pillar['docker']['hd_dir'] }}/postgres/data:/hddata
{% endif %}
    - environment:
      - POSTGRES_PASSWORD: {{ pillar['pg_password'] }}
