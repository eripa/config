{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.cli-apps.wshowkeys;
in
{
  options.horizon.cli-apps.wshowkeys = with types; {
    enable = mkBoolOpt false "Whether or not to enable wshowkeys.";
  };

  config = mkIf cfg.enable {
    horizon.user.extraGroups = [ "input" ];
    environment.systemPackages = with pkgs; [ wshowkeys ];
  };
}
