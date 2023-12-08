{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.system.time;
in {
  options.horizon.system.time = with types; {
    enable =
      mkBoolOpt false "Whether or not to configure timezone information.";
  };

  config = mkIf cfg.enable {time.timeZone = "America/Vancouver";};
}
