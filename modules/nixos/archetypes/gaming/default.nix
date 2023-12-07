{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.archetypes.gaming;
in
{
  options.horizon.archetypes.gaming = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming archetype.";
  };

  config = mkIf cfg.enable {
    horizon.suites = {
      common = enabled;
      desktop = enabled;
      games = enabled;
      social = enabled;
      media = enabled;
    };
  };
}
