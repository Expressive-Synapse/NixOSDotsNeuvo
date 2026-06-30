{ self, inputs, ... }: {
  flake.nixosModules.stylix =
    {
      inputs,
      config,
      pkgs,
      ...
    }:
    {

      imports = [
        inputs.stylix.nixosModules.stylix
      ];
      stylix.enable = true;

      stylix.base16Scheme = "./themes/Catppuccin Mocha.yaml";

      stylix.cursor = {
        package = pkgs.catppuccin-cursors.mochaDark;
        name = "catppuccin-mocha-dark-cursors";
        size = 24;
      };

      stylix.fonts = {

        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        monospace = {
          package = pkgs.nerd-fonts.inconsolata;
          name = "Inconsolata";
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };

      };

      stylix.opacity = {
        terminal = 0.7;
        popups = 0.7;
      };

      stylix.targets.hyprland.enable = false;

      stylix.targets.waybar.enable = false;

      stylix.targets.rofi.enable = false;

      stylix.targets.tofi.enable = false;

      stylix.targets.starship.enable = false;

      stylix.targets.zen-browser = {
        profileNames = [
          "expressive-synapse"
        ];
      };

    };
}
