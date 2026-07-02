{ self, inputs, ... }: {
  flake.nixosModules.picard = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.picard
    ];
  };
}
