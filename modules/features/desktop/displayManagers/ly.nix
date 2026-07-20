{ self, inputs, ... }: {

  flake.nixosModules.desktop = { ... }: {
    services.displayManager.ly = {
      enable = true;
    };
  };
}
