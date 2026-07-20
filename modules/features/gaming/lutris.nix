{ self, inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.lutris
    ];
  };
}
