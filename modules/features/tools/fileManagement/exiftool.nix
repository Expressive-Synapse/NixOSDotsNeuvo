{ self, inputs, ... }: {
  flake.nixosModules.tools = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.exiftool
    ];
  };
}
