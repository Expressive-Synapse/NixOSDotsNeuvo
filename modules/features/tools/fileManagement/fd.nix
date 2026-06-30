{ self, inputs, ... }: {
  flake.nixosModules.fd = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.fd
    ];
  };
}
