avahi-tools:
  pkg.installed

avahi-daemon:
  service.running:
    - enable: True

mdns open on public:
  firewalld.present:
    - name: public
    - prune_services: false
    - services:
      - mdns
