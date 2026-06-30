{ self, inputs, ... }:

{
  flake.nixosModules.clamav = { ... }: {
    services.clamav.daemon.enable = true;
    services.clamav.updater.enable = true;
    services.clamav.scanner.enable = false;
  };
}
