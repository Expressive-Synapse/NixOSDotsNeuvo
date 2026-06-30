{ self, inputs, ... }: {
  flake.nixosModules.deviceNintendoSwitch = { ... }: {

    services.udev.extraRules = ''SUBSYSTEM=="usb", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="3000", MODE="0666"'';
  };
}
