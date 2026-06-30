{ self, inputs, ... }: {
  flake.nixosModules.minecraft = { pkgs, ... }: {

    home.packages = [
      pkgs.prismlauncher
    ];

  };
}
