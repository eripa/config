{ lib, makeDesktopItem, firefox, ... }:

let
  with-meta = lib.horizon.override-meta {
    platforms = lib.platforms.linux;
    broken = firefox.meta.broken;

    description = "A desktop item to open Twitter in Firefox.";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ jakehamilton ];
  };

  twitter =
    makeDesktopItem {
      name = "Twitter";
      desktopName = "Twitter";
      genericName = "The toxic bird app.";
      exec = ''
        ${firefox}/bin/firefox "https://twitter.com/home?horizon.app=true"'';
      icon = ./icon.svg;
      type = "Application";
      categories = [ "Network" "InstantMessaging" "Feed" ];
      terminal = false;
    };
in
with-meta twitter
