{ self, inputs, ... }: {
  flake.nixosModules.dosbox = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.dosbox-staging
    ];
  };
}
