{ self, inputs, ... }: {
  flake.nixosModules.deviceMTPFS = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.jmtpfs
      pkgs.simple-mtpfs
    ];
  };
}
