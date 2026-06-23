{
  preservation = {
    enable = true;

    preserveAt."/persist" = {
      files = [ ];
      directories = [
        "/etc/nixos"
      ];

      users.expressive-synapse = {
        files = [ ];
        directories = [
          ".ssh"
          ".zen"
          "Pictures"
          "Documents"
          "Videos"
          "Zomboid"

          "Downloads/torrents"

          ".config/waypaper"
          ".config/Proton/VPN"
          ".config/inkscape"
          ".config/blender"
          ".config/discord"
          ".config/Vencord"
          ".config/dosbox"
          ".config/retroarch"
          ".config/VintagestoryData"
          ".config/VirtualBox"
          ".config/qBittorrent"

          ".local/share/atuin"
          ".local/share/keyrings"
          ".local/share/Steam"
          ".local/share/PrismLauncher"
          ".local/share/Hytale"
          ".local/share/Hytale-launcher"
          ".local/share/FoundryVTT"
          ".local/share/qBittorrent"
          ".local/share/bottles"
          ".local/share/lutris"
        ];
      };
    };
  };
}
