{ self, inputs, ... }: {

  flake.nixosConfigurations.NixLab = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
      self.nixosModules.NixLabConfiguration
    ];
  };
}
