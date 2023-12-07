{ options, config, pkgs, lib, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.tools.at;
in
{
  options.horizon.tools.at = with types; {
    enable = mkBoolOpt false "Whether or not to install at.";
    pkg = mkOpt package pkgs.horizon.at "The package to install as at.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      cfg.pkg
    ];
  };
}
