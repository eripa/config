{ options, config, lib, pkgs, ... }:
with lib;
with lib.horizon;
let cfg = config.horizon.archetypes.workstation;
in
{
  options.horizon.archetypes.workstation = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable the workstation archetype.";
  };

  config = mkIf cfg.enable {
    horizon = {
      suites = {
        common = enabled;
        desktop = enabled;
        development = enabled;
        art = enabled;
        video = enabled;
        social = enabled;
        media = enabled;
      };

      tools = {
        appimage-run = enabled;
      };
    };
  };
}
