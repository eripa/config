{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.doukutsu-rs;
  desktopItem = pkgs.makeDesktopItem {
    name = "doukutsu-rs";
    desktopName = "doukutsu-rs";
    genericName =
      "A fully playable re-implementation of Cave Story (Doukutsu Monogatari) engine written in Rust.";
    exec = "${pkgs.horizon.doukutsu-rs}/bin/doukutsu-rs";
    icon = ./icon.png;
    type = "Application";
    categories = [ "Game" "AdventureGame" ];
    terminal = false;
  };
in
{
  options.horizon.apps.doukutsu-rs = with types; {
    enable = mkBoolOpt false "Whether or not to enable doukutsu-rs.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.horizon; [
      doukutsu-rs
      desktopItem
    ];
  };
}
