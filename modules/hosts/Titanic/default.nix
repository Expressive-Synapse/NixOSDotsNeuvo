{
  self,
  inputs,
  system,
  ...
}:
{

  flake.nixosConfigurations.Titanic = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
      inputs.zen-browser.x86_64-linux.beta
      self.nixosModules.TitanicConfiguration
    ];
  };
}
