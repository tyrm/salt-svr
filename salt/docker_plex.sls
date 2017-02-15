plexmediaserver firewall service:
  firewalld.service:
    - name: plexmediaserver
    - ports:
      - 32400/tcp

plexmediaserver open on public:
  firewalld.present:
    - name: public
    - prune_services: false
    - services:
      - plexmediaserver

plexmediaserver container:
  dockerng.running:
    - name: plex
    - image: linuxserver/plex:latest
    - restart_policy: always
    - network_mode: host
    - binds:
      - {{ pillar['plex']['media'] }}:/data/media:ro
      - {{ pillar['docker']['ssd_dir'] }}/plex/config:/config
    - environment:
      - VERSION: latest
      - PUID: '{{ pillar['plex']['uid'] }}'
      - PGID: '{{ pillar['plex']['gid'] }}'
      - TZ: {{ pillar['timezone'] }}
