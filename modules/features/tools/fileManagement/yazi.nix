{ self, inputs, ... }: {
  flake.nixosModules.yazi = { ... }: {

    programs.yazi.enable = true;

    programs.yazi.settings = {
      opener = {
        edit = [
          {
            run = "hx %s";
            block = true;
            for = "unix";
          }
          {
            run = "hx %s";
            block = true;
            for = "windows";
          }
        ];
      };
    };
  };
}
