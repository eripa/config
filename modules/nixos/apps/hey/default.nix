{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.hey;
in
{
  options.horizon.apps.hey = with types; {
    enable = mkBoolOpt false "Whether or not to enable HEY.";
  };

  config = mkIf cfg.enable { environment.systemPackages = with pkgs.horizon; [ hey ]; };
}
