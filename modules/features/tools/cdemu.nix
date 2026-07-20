{ self, inputs, ... }: {
  flake.nixosModules.tools = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.cdemu-daemon
    ];
    programs.cdemu.enable = true;

  };
}
