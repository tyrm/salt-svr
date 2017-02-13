pg_axiom:
  dockerng.running:
    - name: postgres
    - image: postgres:latest
    - port_bindings: 5432:5432
    - binds: {{ pillar['docker']['ssd_dir'] }}/postgres/data:/var/lib/postgresql/data
    - environment:
      - POSTGRES_PASSWORD: {{ pillar['pg_password'] }}
