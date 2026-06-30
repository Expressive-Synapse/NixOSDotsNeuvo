{ self, inputs, ... }: {
  flake.nixosModules.cdemu = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.cdemu-daemon
    ];
    programs.cdemu.enable = true;

  };
}
