{ self, inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {

    home.packages = [
      pkgs.vintagestory
    ];

  };
}
