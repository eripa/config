{ config, lib, pkgs, ... }:

let
  cfg = config.horizon.tools.icehouse;

  inherit (lib) mkEnableOption mkIf;
in
{
  options.horizon.tools.icehouse = {
    enable = mkEnableOption "Icehouse";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.snowfallorg.icehouse ];
  };
}
