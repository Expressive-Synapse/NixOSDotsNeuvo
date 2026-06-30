{ self, inputs, ... }: {
  flake.nixosModules.gameModding = { pkgs, ... }: {

    home.packages = [
      pkgs.r2modman
      pkgs.scarab
      pkgs.olympus
    ];

  };
}
