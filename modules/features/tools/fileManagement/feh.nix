{ self, inputs, ... }: {
  flake.nixosModules.feh = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.feh
    ];
  };
}
