{ self, inputs, ... }: {
  flake.nixosModules.javascript = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.nodejs
    ];
  };
}
