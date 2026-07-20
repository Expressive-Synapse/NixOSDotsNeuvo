{ self, inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {

    home.packages = [
      pkgs.r2modman
      pkgs.scarab
      pkgs.olympus
    ];

  };
}
