{ self, inputs, ... }: {

  flake.nixosModules.ly = { ... }: {
    services.displayManager.ly = {
      enable = true;
    };
  };
}
