{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.suites.emulation;
in
{
  options.horizon.suites.emulation = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable emulation configuration.";
  };

  config = mkIf cfg.enable {
    horizon = {
      apps = {
        yuzu = enabled;
        pcsx2 = enabled;
        dolphin = enabled;
      };
    };
  };
}
