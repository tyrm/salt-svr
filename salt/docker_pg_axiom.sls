pg_axiom:
  dockerng.running:
    - name: pg_axiom
    - image: postgres:latest
    - port_bindings: 5432:5432
    - binds: /mnt/axiom/docker/pg_axiom/data:/var/lib/postgresql/data
    - environment:
      - POSTGRES_PASSWORD: {{ pillar['pg_password'] }}
