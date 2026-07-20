{ self, inputs, ... }: {
  flake.nixosModules.tools = { ... }: {
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
