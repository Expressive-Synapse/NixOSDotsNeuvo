{ self, inputs, ... }: {

  flake.nixosModules.starship =
    { config, lib, ... }:
    {

      programs.starship.enable = true;
      programs.starship.settings = {
        "$schema" = "https://starship.rs/config-schema.json";
        format = lib.concatStrings [
          "[ ](base09)"
          "$os"
          "$username"
          "[ ](bg:base0A fg:base09)"
          "$directory"
          "[ ](fg:base0A bg:base0c)"
          "$git_branch"
          "$git_status"
          "[ ](fg:base0c bg:base0D)"
          "$c"
          "$rust"
          "$golang"
          "$nodejs"
          "$php"
          "$java"
          "$kotlin"
          "$haskell"
          "$python"
          "$nix_shell"
          "$lua"
          "[ ](fg:base0D bg:base04)"
          "$docker_context"
          "$conda"
          "[](fg:base04 bg:base04)"
          "[ ](fg:base04)"
          "$line_break$character"
        ];
        palette = "stylix";

        palettes = {
          stylix = {
            base00 = "#${config.lib.stylix.colors.base00}";
            base01 = "#${config.lib.stylix.colors.base01}";
            base02 = "#${config.lib.stylix.colors.base02}";
            base03 = "#${config.lib.stylix.colors.base03}";
            base04 = "#${config.lib.stylix.colors.base04}";
            base05 = "#${config.lib.stylix.colors.base05}";
            base06 = "#${config.lib.stylix.colors.base06}";
            base07 = "#${config.lib.stylix.colors.base07}";
            base08 = "#${config.lib.stylix.colors.base08}";
            base09 = "#${config.lib.stylix.colors.base09}";
            base0a = "#${config.lib.stylix.colors.base0A}";
            base0b = "#${config.lib.stylix.colors.base0B}";
            base0c = "#${config.lib.stylix.colors.base0C}";
            base0d = "#${config.lib.stylix.colors.base0D}";
            base0e = "#${config.lib.stylix.colors.base0E}";
            base0f = "#${config.lib.stylix.colors.base0F}";
          };
        };

        os = {
          disabled = false;
          style = "bg:base09 fg:base04";
          symbols = {
            Windows = "󰍲";
            Ubuntu = "󰕈";
            SUSE = "";
            Raspbian = "󰐿";
            Mint = "󰣭";
            Macos = "󰀵";
            Manjaro = "";
            Linux = "󰌽";
            Gentoo = "󰣨";
            Fedora = "󰣛";
            Alpine = "";
            Amazon = "";
            Android = "";
            Arch = "󰣇";
            Artix = "󰣇";
            EndeavourOS = "";
            CentOS = "";
            Debian = "󰣚";
            Redhat = "󱄛";
            RedHatEnterprise = "󱄛";
            Pop = "";
            NixOS = "󱄅";
          };
        };

        username = {
          show_always = true;
          style_user = "bg:base09 fg:base04";
          style_root = "bg:base09 fg:base04";
          format = "[ $user ]($style)";
        };
        directory = {
          style = "fg:base04 bg:base0A";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
          substitutions = {
            "Documents" = "󰈙 ";
            "Downloads" = " ";
            "Music" = "󰝚 ";
            "Pictures" = " ";
            "Developer" = "󰲋 ";
            "NixOSDots" = "";
          };
        };
        git_branch = {
          symbol = "";
          style = "bg:base0c";
          format = "[[ $symbol $branch ](fg:base04 bg:base0c)]($style)";
        };
        git_status = {
          style = "bg:base0C";
          format = "[[($all_status$ahead_behind )](fg:base04 bg:base0C)]($style)";
        };
        nodejs = {
          symbol = "";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        c = {
          symbol = " ";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        rust = {
          symbol = "";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        golang = {
          symbol = "";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        php = {
          symbol = "";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        java = {
          symbol = "";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        kotlin = {
          symbol = "";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        haskell = {
          symbol = "";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        python = {
          symbol = "";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        nix_shell = {
          symbol = "󱄅";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        lua = {
          symbol = "";
          style = "bg:base0D";
          format = "[[ $symbol( $version) ](fg:base06 bg:base0D)]($style)";
        };
        docker_context = {
          symbol = "";
          style = "bg:base04";
          format = "[[ $symbol( $context) ](fg:base0c bg:base04)]($style)";
        };
        conda = {
          style = "bg:base04";
          format = "[[ $symbol( $environment) ](fg:base0c bg:base04)]($style)";
        };
        line_break = {
          disabled = false;
        };
        character = {
          disabled = false;
          success_symbol = "[](bold fg:base0B)";
          error_symbol = "[](bold fg:base08)";
          vimcmd_symbol = "[](bold fg:base0B)";
          vimcmd_replace_one_symbol = "[](bold fg:base0E)";
          vimcmd_replace_symbol = "[](bold fg:base0E)";
          vimcmd_visual_symbol = "[](bold fg:base0A)";
        };
      };

    };
}
