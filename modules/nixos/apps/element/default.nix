{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.element;
in
{
  options.horizon.apps.element = with types; {
    enable = mkBoolOpt false "Whether or not to enable Element.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ element-desktop ];
  };
}
