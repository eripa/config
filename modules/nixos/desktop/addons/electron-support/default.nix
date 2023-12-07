{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.desktop.addons.electron-support;
in
{
  options.horizon.desktop.addons.electron-support = with types; {
    enable = mkBoolOpt false
      "Whether to enable electron support in the desktop environment.";
  };

  config = mkIf cfg.enable {
    horizon.home.configFile."electron-flags.conf".source =
      ./electron-flags.conf;

    environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };
  };
}
