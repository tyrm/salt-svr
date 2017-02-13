docker_etcd:
  dockerng.running:
    - name: etcd
    - image: elcolio/etcd:latest
    - port_bindings:
      - 2379:2379
      - 2380:2380
      - 4001:4001
      - 7001:7001
    - binds: {{ pillar['docker']['hd_dir'] }}/etcd/data:/data:rw
    - cmd: -name etcd_{{ grains['host'] }}
