{ self, inputs, ... }: {

  perSystem = { pkgs, lib, ... }: {

    packages.myHelix = inputs.wrapper-modules.wrappers.helix.wrap {
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt;
        }
      ];

    };
  };

}
