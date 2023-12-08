{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.suites.development;
in
{
  options.horizon.suites.development = with types; {
    enable = mkBoolOpt false
      "Whether or not to enable common development configuration.";
  };

  config = mkIf cfg.enable {
    horizon = {
      apps = {
        vscode = enabled;
      };

      tools = {
        # at = enabled;
        # direnv = enabled;
        # go = enabled;
        # http = enabled;
        # k8s = enabled;
        # node = enabled;
        # titan = enabled;
        python = enabled;
        # java = enabled;
      };

      # virtualisation = { podman = enabled; };
    };
  };
}
