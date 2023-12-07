{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.tools.appimage-run;
in
{
  options.horizon.tools.appimage-run = with types; {
    enable = mkBoolOpt false "Whether or not to enable appimage-run.";
  };

  config = mkIf cfg.enable {
    horizon.home.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [
      appimage-run
    ];
  };
}
