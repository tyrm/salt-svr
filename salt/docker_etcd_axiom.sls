etcd_axiom:
  dockerng.running:
    - name: etcd_axiom
    - image: elcolio/etcd:latest
    - port_bindings:
      - 2379:2379
      - 2380:2380
      - 4001:4001
      - 7001:7001
    - binds: /mnt/axiom/etcd/data:/data:rw
    - cmd: -name etcd_axiom
