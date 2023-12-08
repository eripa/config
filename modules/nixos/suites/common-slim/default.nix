{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.suites.common-slim;
in {
  options.horizon.suites.common-slim = with types; {
    enable = mkBoolOpt false "Whether or not to enable common-slim configuration.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.horizon.list-iommu
    ];

    horizon = {
      nix = enabled;

      # TODO: Enable this once Attic is configured again.
      # cache.public = enabled;

      cli-apps = {
        flake = enabled;
        # thaw = enabled;
      };

      tools = {
        git = enabled;
        fup-repl = enabled;
        comma = enabled;
        bottom = enabled;
        direnv = enabled;
      };

      hardware = {
        # storage = enabled;
        networking = enabled;
      };

      services = {
        openssh = enabled;
        # tailscale = enabled;
      };

      security = {
        doas = enabled;
      };

      system = {
        boot = enabled;
        fonts = enabled;
        locale = enabled;
        time = enabled;
        xkb = enabled;
      };
    };
  };
}
