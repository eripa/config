{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.yuzu;
in
{
  options.horizon.apps.yuzu = with types; {
    enable = mkBoolOpt false "Whether or not to enable Yuzu.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ yuzu-mainline ];
  };
}
