{ config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.tools.attic;
in
{
  options.horizon.tools.attic = {
    enable = mkEnableOption "Attic";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      attic
    ];
  };
}
