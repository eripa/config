{ lib, config, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.services.homer;

  yaml-format = pkgs.formats.yaml { };
  settings-yaml = yaml-format.generate "config.yml" cfg.settings;

  settings-path =
    if cfg.settings-path != null then
      cfg.settings-path
    else
      builtins.toString settings-yaml;
in
{
  options.horizon.services.homer = {
    enable = mkEnableOption "Homer";

    package = mkOpt types.package pkgs.horizon.homer "The package of Homer assets to use.";

    settings = mkOpt yaml-format.type { } "Configuration for Homer's config.yml file.";
    settings-path = mkOpt (types.nullOr types.path) null "A replacement for the generated config.yml file.";

    host = mkOpt (types.nullOr types.str) null "The host to serve Homer on.";

    nginx = {
      forceSSL = mkOption {
        type = types.bool;
        default = false;
        description = "Whether or not to force the use of SSL.";
      };
    };

    acme = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description =
          "Whether or not to automatically fetch and configure SSL certs.";
      };
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = cfg.host != null;
        message = "horizon.services.homer.host must be set.";
      }
      {
        assertion = cfg.settings-path != null -> cfg.settings == { };
        message = "horizon.services.homer.settings and horizon.services.homer.settings-path are mutually exclusive.";
      }
      {
        assertion = cfg.nginx.forceSSL -> cfg.acme.enable;
        message = "horizon.services.homer.nginx.forceSSL requires setting horizon.services.homer.acme.enable to true.";
      }
    ];

    services.nginx = {
      enable = true;

      virtualHosts."${cfg.host}" = {
        enableACME = cfg.acme.enable;
        forceSSL = cfg.nginx.forceSSL;

        locations."/" = {
          root = "${cfg.package}/share/homer";
        };

        locations."= /assets/config.yml" = {
          alias = settings-path;
        };
      };
    };
  };
}
