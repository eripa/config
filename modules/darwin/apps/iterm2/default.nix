{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.iterm2;
in
{
  options.horizon.apps.iterm2 = with types; {
    enable = mkBoolOpt false "Whether or not to enable iTerm2.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      iterm2
    ];
  };
}
