{ self, inputs, ... }: {
  flake.nixosModules.dust = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.dust
    ];
  };
}
