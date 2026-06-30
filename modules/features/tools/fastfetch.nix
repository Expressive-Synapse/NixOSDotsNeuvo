{ self, inputs, ... }: {
  flake.nixosModules.fastfetch = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.fastfetch
    ];
  };
}
