{ options, config, pkgs, lib, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.desktop.addons.wallpapers;
  inherit (pkgs.horizon) wallpapers;
in
{
  options.horizon.desktop.addons.wallpapers = with types; {
    enable = mkBoolOpt false
      "Whether or not to add wallpapers to ~/Pictures/wallpapers.";
  };

  config = {
    horizon.home.file = lib.foldl
      (acc: name:
        let wallpaper = wallpapers.${name};
        in
        acc // {
          "Pictures/wallpapers/${wallpaper.fileName}".source = wallpaper;
        })
      { }
      (wallpapers.names);
  };
}
