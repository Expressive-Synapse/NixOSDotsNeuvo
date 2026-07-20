{ self, inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      (retroarch.withCores (
        cores: with cores; [
          genesis-plus-gx
          snes9x
          beetle-psx-hw
          mame
          beetle-pcfx
          beetle-pce
          mupen64plus
        ]
      ))
    ];

    services.xserver.desktopManager.retroarch.enable = true;
  };
}
