{ self, inputs, ... }: {

  flake.nixosModules.TitanicConfiguration =
    {
      inputs,
      config,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [
        # Include the results of the hardware scan.
        self.nixosModules.TitanicHardware
        self.nixosModules.TitanicDisko
        self.nixosModules.TitanicPreservation

        self.nixosModules.desktop
        self.nixosModules.devices
        self.nixosModules.gaming
        self.nixosModules.office
        self.nixosModules.tools

        self.nixosModules.bash
        self.nixosModules.starship

        self.nixosModules.javascript

        self.nixosModules.clamav
        self.nixosModules.discord
        self.nixosModules.dosbox
        self.nixosModules.keypass
        self.nixosModules.ns-usbloader
        self.nixosModules.protonvpn
        self.nixosModules.qbittorrent
        self.nixosModules.syncthing
        self.nixosModules.virtualbox
        self.nixosModules.wine
        self.nixosModules.zen-browser
      ];

      # Bootloader.
      boot.loader.grub.enable = true;
      boot.loader.grub.efiSupport = true;
      #  boot.loader.efi.efiSysMountPoint = "/boot";
      #  boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.grub.device = "/dev/sda";

      ###################################################
      #                    FileSystem                   #
      ###################################################
      boot.initrd.systemd = {
        services.impermance-btrfs-rolling-root = {
          description = "Archiving existing BTRFS root subvolume and creating a fresh one";
          # Specify dependencies explicitly
          unitConfig.DefaultDependencies = false;
          # The script needs to run to completion before this service is done
          serviceConfig = {
            Type = "oneshot";
            # NOTE: to be able to see errors in your script do this
            # StandardOutput = "journal+console";
            # StandardError = "journal+console";
          };
          # This service is required for boot to succeed
          requiredBy = [ "initrd.target" ];
          # Should complete before any file systems are mounted
          before = [ "sysroot.mount" ];

          # Wait until the root device is available
          # If you're altering a different device, specify its device unit explicitly.
          # see: systemd-escape(1)
          requires = [ "initrd-root-device.target" ];
          after = [
            "initrd-root-device.target"
            # Allow hibernation to resume before trying to alter any data
            "local-fs-pre.target"
          ];
          # The body of the script. Make your changes to data here
          script = ''
            mkdir /btrfs_tmp
            mount /dev/mapper/main /btrfs_tmp
            if [[ -e /btrfs_tmp/root ]]; then
                mkdir -p /btrfs_tmp/old_roots
                timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
                mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
            fi

            delete_subvolume_recursively() {
                IFS=$'\n'
                for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
                    delete_subvolume_recursively "/btrfs_tmp/$i"
                done
                btrfs subvolume delete "$1"
            }

            for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
                delete_subvolume_recursively "$i"
            done

            btrfs subvolume create /btrfs_tmp/root
            umount /btrfs_tmp
          '';
        };
        extraBin = {
          # "mkfs.ext4" = "${pkgs.e2fsprogs}/bin/mkfs.ext4";
          "mkdir" = "${pkgs.coreutils}/bin/mkdir";
          "date" = "${pkgs.coreutils}/bin/date";
          "stat" = "${pkgs.coreutils}/bin/stat";
          "mv" = "${pkgs.coreutils}/bin/mv";
          "find" = "${pkgs.findutils}/bin/find";
          "btrfs" = "${pkgs.btrfs-progs}/bin/btrfs";
          # mount & umount already exist
        }; # NOTE: path = [...]; doesnt work for initrd, use full paths in your script or extraBin
      };
      fileSystems."/persist".neededForBoot = true;

      ###################################################
      #                     Network                     #
      ###################################################
      networking.hostName = "Titanic"; # Define your hostname.
      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      # Enable networking
      networking.networkmanager.enable = true;

      ###################################################
      #                    Security                     #
      ###################################################

      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;

      sops.defaultSopsFile = ../../secrets/secrets.yaml;
      sops.defaultSopsFormat = "yaml";

      networking.firewall.enable = true;
      networking.firewall.allowedTCPPorts = [ 30000 ]; # FoundryVTT
      networking.firewall.allowedUDPPorts = [ 30000 ];
      ###################################################
      #                    Location                     #
      ###################################################
      # Set your time zone.
      time.timeZone = "America/New_York";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
      #################################################
      #              Display Services                 #
      #################################################

      # Enable the X11 windowing system.
      services.xserver.enable = true;

      # Configure keymap in X11
      # services.xserver.xkb.layout = "us";
      # services.xserver.xkb.options = "eurosign:e,caps:escape";

      # Enable CUPS to print documents.
      # services.printing.enable = true;

      programs.xwayland.enable = true;

      hardware.graphics.enable = true;
      #################################################
      #               Audio Services                  #
      #################################################
      # Enable sound.
      # services.pulseaudio.enable = true;
      # OR
      services.pipewire = {
        enable = true;
        wireplumber.enable = true;
        pulse.enable = true;
      };

      ###################################################
      #                     Users                       #
      ###################################################

      # ---------------expressive-synapse--------------

      sops.age.keyFile = "/persist/Keys/sops-key.txt";
      sops.secrets."users/expressive-synapse/accountpass" = {
        neededForUsers = true;

      };

      users.users.expressive-synapse = {
        isNormalUser = true;
        hashedPasswordFile = config.sops.secrets."users/expressive-synapse/accountpass".path;
        uid = 1000;
        description = "Connor Goff";
        extraGroups = [
          "networkmanager"
          "wheel"
          "cdrom"
          "maccel"
        ];
      };
      programs.fuse.userAllowOther = true;
      ###################################################
      #                    Packages                     #
      ###################################################
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs; [
        vim
        wget
        git
        sops
        wl-clipboard
        nix-index
      ];

      ###################################################
      #                   Keymapping                    #
      ###################################################
      # Configure keymap in X11
      services.xserver = {
        xkb.layout = "us";
        xkb.variant = "";
      };
      services.xremap.enable = true;
      services.xremap.withWlroots = true;
      services.xremap.config.modmap = [
        {
          name = "cool CapsLock";
          remap = {
            CapsLock = {
              held = "leftctrl";
              alone = "esc";
              alone_timeout_millis = 150;
            };
          };
        }
      ];

      ###################################################
      #                     NixOS                       #
      ###################################################

      nix.settings = {
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      };
      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "23.11"; # Did you read the comment?

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
}
