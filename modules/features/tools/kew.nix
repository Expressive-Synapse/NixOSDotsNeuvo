{ self, inputs, ... }: {
  flake.nixosModules.kew = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.kew
    ];
  };
}
