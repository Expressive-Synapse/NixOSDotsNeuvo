{ self, inputs, ... }:
{
  flake.nixosModules.zen-browser = { system, ... }: {
    imports = [
      inputs.zen-browser."${system}".beta
    ];

    programs.zen-browser = {
      enable = true;
      profiles = {
        "expressive-synapse" = { };
      };
    };
  };
}
