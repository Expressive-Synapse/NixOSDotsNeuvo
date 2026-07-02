{ self, inputs, ... }: {
  flake.nixosModules.ns-usbloader = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.ns-usbloader
    ];
  };
}
