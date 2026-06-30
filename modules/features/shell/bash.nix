{ self, inputs, ... }: {
  flake.nixosModules.bash = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.atuin
    ];
    programs.bash = {
      enable = true;
      blesh.enable = true;
      shellInit = /* bash */ "
    source \"$(blesh-share)\"/ble.sh --attach=none\n
    eval \"$(atuin init bash)\"\n
    [[ \${BLE_VERSION-} ]] && ble-attach
  ";
    };
  };
}
