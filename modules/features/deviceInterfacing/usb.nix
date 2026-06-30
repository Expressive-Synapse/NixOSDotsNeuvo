{ self, inputs, ... }: {
  flake.nixosModules.deviceUSB = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.usbutils
    ];
  };
}
