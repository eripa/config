{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.cli-apps.tmux;
in {
  options.horizon.cli-apps.tmux = {
    enable = mkEnableOption "Tmux";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      horizon.tmux
    ];
  };
}
