{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.etcher;
in
{
  options.horizon.apps.etcher = with types; {
    enable = mkBoolOpt false "Whether or not to enable etcher.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      [
        # Etcher is currently broken in nixpkgs, temporarily replaced with
        # gnome disk utility.
        # etcher
        gnome.gnome-disk-utility
      ];
  };
}
