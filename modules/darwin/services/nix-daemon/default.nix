{ lib, config, ... }:

let
  inherit (lib) types mkIf;
  inherit (lib.horizon) mkOpt enabled;

  cfg = config.horizon.services.nix-daemon;
in
{
  options.horizon.services.nix-daemon = {
    enable = mkOpt types.bool true "Whether to enable the Nix daemon.";
  };

  config = mkIf cfg.enable {
    services.nix-daemon = enabled;
  };
}
