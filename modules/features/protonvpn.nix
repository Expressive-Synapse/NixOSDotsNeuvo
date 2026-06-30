{ self, inputs, ... }:

{
  flake.nixosModules.protonvpn = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      proton-vpn
    ];
  };
}
