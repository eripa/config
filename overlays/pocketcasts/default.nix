{ channels, ... }:

final: prev: {
  horizon = (prev.horizon or { }) // {
    pocketcasts = prev.makeDesktopItem {
      name = "Pocketcasts";
      desktopName = "Pocketcasts";
      genericName = "It’s smart listening, made simple.";
      exec = ''
        ${final.firefox}/bin/firefox "https://play.pocketcasts.com/podcasts?horizon.app=true"'';
      icon = ./icon.svg;
      type = "Application";
      categories = [ "Network" "Feed" "AudioVideo" "Audio" "Player" ];
      terminal = false;
    };
  };
}
