{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.desktop.addons.keyring;
in
{
  options.horizon.desktop.addons.keyring = with types; {
    enable = mkBoolOpt false "Whether to enable the gnome keyring.";
  };

  config = mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [ gnome.seahorse ];
  };
}
