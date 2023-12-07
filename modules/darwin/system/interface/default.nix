{ options, config, pkgs, lib, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.system.interface;
in
{
  options.horizon.system.interface = with types; {
    enable = mkEnableOption "macOS interface";
  };

  config = mkIf cfg.enable {
    system.defaults = {
      dock.autohide = true;

      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
      };

      NSGlobalDomain = {
        _HIHideMenuBar = true;
        AppleShowScrollBars = "Always";
      };
    };

    horizon.home.file.".hushlogin".text = "";
  };
}
