{ self, inputs, ... }: {

  flake.nixosConfigurations.Titanic = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
      self.nixosModules.TitanicConfiguration
    ];
  };
}
