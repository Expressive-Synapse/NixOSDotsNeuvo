{ ... }:

{
disko.devices = {
  disk = {
    disk0 = {
      device = "/dev/sda";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            name = "boot";
            size = "1M";
            type = "EF02";
          };
          esp = {
            name = "ESP";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [
                "defaults"
              ];
            };
          };
          main = {
            size = "100%";
            content = {
              type = "luks";
              name = "main";
              passwordFile = "/tmp/secret.key";
              settings.allowDiscards = true;
              content = {
                type = "btrfs";
                extraArgs = ["-f"];
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                  };
                  "/persist" = {
                    mountOptions = ["subvol=persist" "noatime"];
                    mountpoint = "/persist";
                  };
                  "/nix" = {
                    mountOptions = ["subvol=nix" "noatime"];
                    mountpoint = "/nix";
                  };
                  "/swap" = {
                    mountpoint = "/.swapvol";
                    swap.swapfile.size = "64G";
                  };
                };
              };
            };
          };
        };
      };
    };
    disk1 = {
      device = "/dev/nvme0n1";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          main = {
            size = "100%";
            content = {
              type = "luks";
              name = "crypted";
              passwordFile = "/tmp/secret.key";
              settings.allowDiscards = true;
              content = {
                type = "btrfs";
                extraArgs = ["-f"];
                subvolumes = {
                  "Games" = {
                    mountOptions = ["subvol=games" "noatime"];
                    mountpoint = "/home/expressive-synapse/Games";
                  };
                  "Bottles" = {
                    mountOptions = ["subvol=bottles" "noatime"];
                    mountpoint = "/home/expressive-synapse/Bottles";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
};
}
