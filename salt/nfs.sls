nfs-utils:
  pkg.installed

nfs:
  service.running:
    - enable: True

nfs open on public:
  firewalld.present:
    - name: public
    - prune_services: false
    - services:
      - nfs

