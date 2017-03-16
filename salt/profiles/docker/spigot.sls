spigot firewall service:
  firewalld.service:
    - name: spigot
    - ports:
      - 25565/tcp

spigot open on public:
  firewalld.present:
    - name: public
    - prune_services: false
    - services:
      - spigot

spigot container:
  dockerng.running:
    - name: spigot
    - image: nimmis/spigot:latest
    - restart_policy: always
    - port_bindings: 25565:25565
    - binds:
      - {{ pillar['docker']['ssd_dir'] }}/spigot/minecraft:/minecraft
      - {{ pillar['docker']['ssd_dir'] }}/spigot/world:/minecraft/world
      - {{ pillar['docker']['ssd_dir'] }}/spigot/world_nether:/minecraft/world_nether
      - {{ pillar['docker']['ssd_dir'] }}/spigot/world_the_end:/minecraft/world_the_end
    - environment:
      - EULA: 'true'
      - MC_MAXMEM: 4g
      - MC_MINMEM: 512m
