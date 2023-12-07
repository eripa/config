{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.cli-apps.proton;
in
{
  options.horizon.cli-apps.proton = with types; {
    enable = mkBoolOpt false "Whether or not to enable Proton.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ proton-caller ];
  };
}
