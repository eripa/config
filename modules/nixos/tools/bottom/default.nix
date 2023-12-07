{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.tools.bottom;
in
{
  options.horizon.tools.bottom = with types; {
    enable = mkBoolOpt false "Whether or not to enable Bottom.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bottom
    ];
  };
}
