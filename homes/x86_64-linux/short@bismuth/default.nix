{ lib, pkgs, config, osConfig ? { }, format ? "unknown", ... }:

with lib.horizon;
{
  horizon = {
    user = {
      enable = true;
      name = config.snowfallorg.user.name;
    };

    cli-apps = {
      zsh = enabled;
      neovim = enabled;
      home-manager = enabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
    };
  };
}
