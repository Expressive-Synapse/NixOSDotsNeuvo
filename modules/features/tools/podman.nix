{ self, inputs, ... }: {
  flake.nixosModules.tools = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      podman-compose
      dive
      podman-tui
    ];

    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
        flags = [
          "--filter=until=24h"
          "--filter=label!=important"
        ];
      };
    };
  };

}
