{ self, inputs, ... }: {
  flake.nixosModules.wine = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.wineWow64Packages.waylandFull
      pkgs.winetricks
    ];
  };
}
