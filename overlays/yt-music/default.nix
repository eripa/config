{ channels, ... }:

final: prev: {
  horizon = (prev.horizon or { }) // {
    yt-music = prev.makeDesktopItem {
      name = "YT Music";
      desktopName = "YT Music";
      genericName = "Music, from YouTube.";
      exec = ''
        ${final.firefox}/bin/firefox "https://music.youtube.com/?horizon.app=true"'';
      icon = ./icon.svg;
      type = "Application";
      categories = [ "AudioVideo" "Audio" "Player" ];
      terminal = false;
    };
  };
}
