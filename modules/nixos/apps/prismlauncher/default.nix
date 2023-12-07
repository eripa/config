{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.prismlauncher;
in
{
  options.horizon.apps.prismlauncher = with types; {
    enable = mkBoolOpt false "Whether or not to enable Prism Launcher.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ prismlauncher ]; };
}
