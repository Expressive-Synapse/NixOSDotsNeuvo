{ self, inputs, ... }: {
  flake.nixosModules.office = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.picard
    ];
  };
}
