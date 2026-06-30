{ self, inputs, ... }: {
  flake.nixosModules.unar = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.unar
    ];
  };
}
