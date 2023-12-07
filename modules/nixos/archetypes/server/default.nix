{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.archetypes.server;
in
{
  options.horizon.archetypes.server = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable the server archetype.";
  };

  config = mkIf cfg.enable {
    horizon = {
      suites = {
        common-slim = enabled;
      };

      cli-apps = {
        neovim = enabled;
        tmux = enabled;
      };
    };
  };
}
