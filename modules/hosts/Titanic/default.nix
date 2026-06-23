{ self, inputs, ... }: {

  flake.nixosConfigurations.Titanic = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.TitanicConfiguration
    ];
  };
}
