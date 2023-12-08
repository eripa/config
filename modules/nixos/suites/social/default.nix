{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.suites.social;
in {
  options.horizon.suites.social = with types; {
    enable = mkBoolOpt false "Whether or not to enable social configuration.";
  };

  config = mkIf cfg.enable {
    horizon = {
      apps = {
        discord = {
          enable = true;
          chromium = enabled;
        };
        element = enabled;
      };
    };
  };
}
