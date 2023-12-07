{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.desktop.addons.xdg-portal;
in
{
  options.horizon.desktop.addons.xdg-portal = with types; {
    enable = mkBoolOpt false "Whether or not to add support for xdg portal.";
  };

  config = mkIf cfg.enable {
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
        ];
        gtkUsePortal = true;
      };
    };
  };
}
