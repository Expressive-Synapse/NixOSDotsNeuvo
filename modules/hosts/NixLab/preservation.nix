{ self, inputs, ... }: {
  flake.nixosModules.NixLabPreservation = {
  
    boot.tmp.cleanOnBoot = true;
  
    preservation = {
      enable = true;

      preserveAt."/persist" = {
        files = [ 
          { file = "/etc/NixLab"; inInitrd = true;}
        ];
        directories = [
          #"/etc/nixos"
          "/var/lib/systemd/timers"
          "/var/lib/nixos"
          "/var/log"
          "/tmp"
        ];

        users.expressive-synapse = {
          files = [ ];
          directories = [
            ".ssh"

            "Downloads/torrents"

            ".local/share/keyrings"
          ];
        };
      };
    };
  };
}
