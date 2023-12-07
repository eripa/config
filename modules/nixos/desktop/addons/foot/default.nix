{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.desktop.addons.foot;
in
{
  options.horizon.desktop.addons.foot = with types; {
    enable = mkBoolOpt false "Whether to enable the gnome file manager.";
  };

  config = mkIf cfg.enable {
    horizon.desktop.addons.term = {
      enable = true;
      pkg = pkgs.foot;
    };

    horizon.home.configFile."foot/foot.ini".source = ./foot.ini;
  };
}
