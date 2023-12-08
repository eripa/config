{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.tools.misc;
in {
  options.horizon.tools.misc = with types; {
    enable = mkBoolOpt false "Whether or not to enable common utilities.";
  };

  config = mkIf cfg.enable {
    horizon.home.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [
      fzf
      killall
      unzip
      file
      jq
      yq-go
      ripgrep
      wget
    ];
  };
}
