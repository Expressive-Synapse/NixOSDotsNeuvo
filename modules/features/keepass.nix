{ self, inputs, ... }: {
  flake.nixosModules.keypass = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.keepassxc
    ];
  };
}
