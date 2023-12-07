{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.suites.games;
  apps = {
    steam = enabled;
    prismlauncher = enabled;
    lutris = enabled;
    winetricks = enabled;
    protontricks = enabled;
    doukutsu-rs = enabled;
    bottles = enabled;
  };
  cli-apps = {
    wine = enabled;
    proton = enabled;
  };
in
{
  options.horizon.suites.games = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common games configuration.";
  };

  config = mkIf cfg.enable { horizon = { inherit apps cli-apps; }; };
}
