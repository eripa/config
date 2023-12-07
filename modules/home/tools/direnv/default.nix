{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.tools.direnv;
in
{
  options.horizon.tools.direnv = with types; {
    enable = mkBoolOpt false "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv = enabled;
    };
  };
}
