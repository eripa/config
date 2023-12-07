{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.cli-apps.thaw;
in {
  options.horizon.cli-apps.thaw = with types; {
    enable = mkBoolOpt false "Whether or not to enable thaw.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      snowfallorg.thaw
    ];
  };
}
