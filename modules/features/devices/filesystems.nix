{ self, inputs, ... }: {
  flake.nixosModules.devices = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.exfat
      pkgs.ntfs3g
    ];
    services.gvfs.enable = true;
  };
}
