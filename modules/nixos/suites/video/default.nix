{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.suites.video;
in {
  options.horizon.suites.video = with types; {
    enable = mkBoolOpt false "Whether or not to enable video configuration.";
  };

  config = mkIf cfg.enable {
    horizon = {
      apps = {
        pitivi = enabled;
        obs = enabled;
      };
    };
  };
}
