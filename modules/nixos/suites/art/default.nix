{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.suites.art;
in
{
  options.horizon.suites.art = with types; {
    enable = mkBoolOpt false "Whether or not to enable art configuration.";
  };

  config = mkIf cfg.enable {
    horizon = {
      apps = {
        gimp = enabled;
        inkscape = enabled;
        blender = enabled;
      };
    };
  };
}
