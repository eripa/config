{ lib, pkgs, config, ... }:

let
  inherit (lib) mkIf mkEnableOption fetchFromGitHub;
  inherit (lib.horizon) mkOpt;

  cfg = config.horizon.services.websites.sokoban;
in
{
  options.horizon.services.websites.sokoban = with lib.types; {
    enable = mkEnableOption "Sokoban Website";
    package = mkOpt package pkgs.horizon.sokoban-website "The site package to use.";
    domain = mkOpt str "sokoban.app" "The domain to serve the website site on.";

    acme = {
      enable = mkOpt bool true "Whether or not to automatically fetch and configure SSL certs.";
    };
  };

  config = mkIf cfg.enable {
    services.nginx = {
      enable = true;

      virtualHosts.${cfg.domain} = {
        enableACME = cfg.acme.enable;
        forceSSL = cfg.acme.enable;

        locations."/" = {
          root = cfg.package;
        };
      };
    };
  };
}
