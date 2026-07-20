{ self, inputs, ... }: {
  flake.nixosModules.devices = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.linuxConsoleTools
    ];
    services.udev.extraRules = ''
      #8BitDo 8BitDo Pro 3 Receiver
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="310b", MODE="0666"
      #8BitDo 8BitDo Pro 3 Controller
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="310b", MODE="0666"
    '';
  };
}
