{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.suites.music;
in
{
  options.horizon.suites.music = with types; {
    enable = mkBoolOpt false "Whether or not to enable music configuration.";
  };

  config = mkIf cfg.enable {
    horizon = {
      apps = {
        ardour = enabled;
        bottles = enabled;
      };
    };
  };
}
