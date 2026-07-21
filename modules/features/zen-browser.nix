{ self, ... }:
{
  flake.nixosModules.zen-browser = { system, ... }: {
    programs.zen-browser = {
      enable = true;
      profiles = {
        "expressive-synapse" = { };
      };
    };
  };
}
