{ self, inputs, ... }: {
  flake.nixosModules.btop = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.btop
    ];
  };
}
