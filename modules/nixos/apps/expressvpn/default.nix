{ lib, config, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.expressvpn;
in
{
  options.horizon.apps.expressvpn = {
    enable = mkEnableOption "Express VPN";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      horizon.expressvpn
    ] ++ optionals config.horizon.desktop.gnome.enable [
      gnomeExtensions.evpn-shell-assistant
    ];

    boot.kernelModules = [ "tun" ];

    systemd.services.expressvpn = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" "network-online.target" ];

      description = "ExpressVPN Daemon";

      serviceConfig = {
        ExecStart = "${pkgs.horizon.expressvpn}/bin/expressvpnd";
        Restart = "on-failure";
        RestartSec = 5;
      };
    };
  };
}
