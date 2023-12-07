{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.apps.inkscape;
in
{
  options.horizon.apps.inkscape = with types; {
    enable = mkBoolOpt false "Whether or not to enable Inkscape.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ inkscape-with-extensions google-fonts ];
  };
}
