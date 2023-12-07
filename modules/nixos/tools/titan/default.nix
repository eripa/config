{ options, config, pkgs, lib, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.tools.titan;
in
{
  options.horizon.tools.titan = with types; {
    enable = mkBoolOpt false "Whether or not to install Titan.";
    pkg = mkOpt package pkgs.horizon.titan "The package to install as Titan.";
  };

  config = mkIf cfg.enable {
    horizon.tools = {
      # Titan depends on Node and Git
      node = enabled;
      git = enabled;
    };

    environment.systemPackages = [
      cfg.pkg
    ];
  };
}
