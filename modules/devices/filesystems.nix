{ self, inputs, ... }: {
  flake.nixosModules.filesystems = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.exfat
      pkgs.ntfs3g
    ];
    services.gvfs.enable = true;
  };
}
