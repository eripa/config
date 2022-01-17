{ options, config, pkgs, lib, ... }:

with lib;
let cfg = config.ultra.system.time;
in {
  options.ultra.system.time = with types; {
    enable = mkBoolOpt true "Whether or not to configure timezone information.";
  };

  config = mkIf cfg.enable { time.timeZone = "America/Los_Angeles"; };
}