{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption fetchFromGitHub;
  inherit (lib.horizon) mkOpt;

  cfg = config.horizon.services.websites.traek;
in {
  options.horizon.services.websites.traek = with lib.types; {
    enable = mkEnableOption "traek.app Website";
    package = mkOpt package pkgs.horizon.traek-website "The site package to use.";
    domain = mkOpt str "traek.app" "The domain to serve the website site on.";

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
