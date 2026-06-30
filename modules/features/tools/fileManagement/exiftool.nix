{ self, inputs, ... }: {
  flake.nixosModules.exiftool = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.exiftool
    ];
  };
}
