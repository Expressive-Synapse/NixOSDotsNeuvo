{ self, inputs, ... }: {
  flake.nixosModules.deviceMouse = { ... }: {

    hardware.maccel = {
      enable = true;
      enableCli = true;
      parameters = {
        mode = "natural";
        inputDpi = 1500.0;
        sensMultiplier = 0.3;
        acceleration = 0.3;
        offset = 2.0;
        outputCap = 2.0;
      };
    };
  };
}
