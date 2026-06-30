{ self, inputs, ... }: {
  flake.nixosModules.vintagestory = { pkgs, ... }: {

    home.packages = [
      pkgs.vintagestory
    ];

  };
}
