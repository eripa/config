{ lib, config, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.horizon) enabled;

  cfg = config.horizon.cli-apps.home-manager;
in
{
  options.horizon.cli-apps.home-manager = {
    enable = mkEnableOption "home-manager";
  };

  config = mkIf cfg.enable {
    programs.home-manager = enabled;
  };
}
