{ self, inputs, ... }: {
  flake.nixosModules.devices = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.usbutils
    ];
  };
}
