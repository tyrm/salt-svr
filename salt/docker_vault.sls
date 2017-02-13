docker_vault:
  dockerng.running:
    - name: vault
    - image: vault:latest
    - port_bindings:
      - 8200:8200
    - binds:
      -  {{ pillar['docker']['hd_dir'] }}/vault/logs:/vault/logs:rw
      -  {{ pillar['docker']['hd_dir'] }}/vault/file:/vault/file:rw
      -  {{ pillar['docker']['hd_dir'] }}/vault/config:/vault/config:rw
    - cap_add: IPC_LOCK
    - cmd: vault server -config=vault/config
