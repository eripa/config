{ lib, makeDesktopItem, firefox, ... }:

let
  with-meta = lib.horizon.override-meta {
    platforms = lib.platforms.linux;
    broken = firefox.meta.broken;
  };

  hey = makeDesktopItem {
    name = "HEY";
    desktopName = "HEY";
    genericName = "The email app that makes email suck less.";
    exec = ''
      ${firefox}/bin/firefox "https://app.hey.com/?horizon.app=true"'';
    icon = ./icon.svg;
    type = "Application";
    categories = [ "Office" "Network" "Email" ];
    terminal = false;
  };
in
with-meta hey
