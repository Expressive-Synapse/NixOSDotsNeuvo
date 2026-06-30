{ self, inputs, ... }: {
  flake.nixosModules.virtualbox = { ... }: {
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "expressive-synapse" ];
    virtualisation.virtualbox.host.enableExtensionPack = true;
  };
}
