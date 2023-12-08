{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.archetypes.workstation-slim;
in {
  options.horizon.archetypes.workstation-slim = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable the workstation slim archetype.";
  };

  config = mkIf cfg.enable {
    horizon = {
      suites = {
        common-slim = enabled;
        desktop = enabled;
        development = enabled;
        media = enabled;
      };

      tools = {
        appimage-run = enabled;
      };
    };
  };
}
