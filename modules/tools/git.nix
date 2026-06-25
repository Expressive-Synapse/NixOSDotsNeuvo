{ self, inputs, ... }: {
  flake.nixosModules.git = { ... }: {
    programs.git = {
      enable = true;
      config = [
        {
          user = {
            name = "Expressive-Synapse";
            email = "ConnorDGoff@protonmail.com";
          };
        }
      ];
    };
  };
}
