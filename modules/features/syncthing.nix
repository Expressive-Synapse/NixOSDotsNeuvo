{ self, inputs, ... }:
{
  flake.nixosModules.syncthing = { ... }: {
    virtualisation.oci-containers.containers."syncthing" = {
      image = "lscr.io/linuxserver/syncthing:latest";
      autoStart = true;
      user = "root";
      environment = {
        PUID = "0";
        PGUID = "0";
        TZ = "Etc/EDT";
      };
      ports = [
        "127.0.0.1:8384:8384"
        "22000:22000/tcp"
        "22000:22000/udp"
        "21027:21027/udp"
      ];
      volumes = [
        "/persist/syncthing:/config"
        "/persist/home/expressive-synapse/Documents/Obsidian/:/Obsidian"
        "/persist/home/expressive-synapse/Documents/Passwords/:/Passwords"
        "/persist/home/expressive-synapse/Documents/Backups/:/Backups"
      ];
    };
  };

}
