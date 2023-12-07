{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.apps.blender;
in
{
  options.horizon.apps.blender = with types; {
    enable = mkBoolOpt false "Whether or not to enable Blender.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ blender ]; };
}
