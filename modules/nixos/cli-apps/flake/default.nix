inputs@{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.cli-apps.flake;
in
{
  options.horizon.cli-apps.flake = with types; {
    enable = mkBoolOpt false "Whether or not to enable flake.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      snowfallorg.flake
    ];
  };
}
