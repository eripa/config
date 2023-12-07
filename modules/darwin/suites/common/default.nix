{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.suites.common;
in
{
  options.horizon.suites.common = with types; {
    enable = mkBoolOpt false "Whether or not to enable common configuration.";
  };

  config = mkIf cfg.enable {
    programs.zsh = enabled;

    horizon = {
      nix = enabled;

      apps = {
        iterm2 = enabled;
      };

      cli-apps = {
        neovim = enabled;
      };

      tools = {
        git = enabled;
        flake = enabled;
      };

      system = {
        fonts = enabled;
        input = enabled;
        interface = enabled;
      };

      security = {
        gpg = enabled;
      };
    };
  };
}
