{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.tools.comma;
in
{
  options.horizon.tools.comma = with types; {
    enable = mkBoolOpt false "Whether or not to enable comma.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      comma
      horizon.nix-update-index
    ];

    horizon.home = {
      configFile = {
        "wgetrc".text = "";
      };

      extraOptions = {
        programs.nix-index.enable = true;
      };
    };
  };
}
