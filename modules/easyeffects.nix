{ self, inputs, ... }: {
  flake.nixosModules.easyeffects = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.easyeffects
    ];
  };
}
