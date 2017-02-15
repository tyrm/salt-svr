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
    - network_mode: host
    - binds:
      - {{ pillar['docker']['ssd_dir'] }}/plex/config:/var/lib/postgresql/data
      - {{ pillar['plex']['media'] }}:/data/media
    - environment:
      - VERSION: latest
      - PUID: {{ pillar['plex']['uid'] }}
      - PGID: {{ pillar['plex']['gid'] }}
      - TZ: {{ pillar['timezone'] }}
  
