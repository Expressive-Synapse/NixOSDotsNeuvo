{ self, inputs, ... }: {
  flake.nixosModules.devices = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.jmtpfs
      pkgs.simple-mtpfs
    ];
  };
}
