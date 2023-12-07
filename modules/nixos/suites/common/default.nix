{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.suites.common;
in {
  options.horizon.suites.common = with types; {
    enable = mkBoolOpt false "Whether or not to enable common configuration.";
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
        thaw = enabled;
      };

      tools = {
        git = enabled;
        misc = enabled;
        fup-repl = enabled;
        comma = enabled;
        nix-ld = enabled;
        bottom = enabled;
      };

      hardware = {
        audio = enabled;
        storage = enabled;
        networking = enabled;
      };

      services = {
        printing = enabled;
        openssh = enabled;
        tailscale = enabled;
      };

      security = {
        gpg = enabled;
        doas = enabled;
        keyring = enabled;
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
