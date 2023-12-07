{ options, config, pkgs, lib, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.services.printing;
in
{
  options.horizon.services.printing = with types; {
    enable = mkBoolOpt false "Whether or not to configure printing support.";
  };

  config = mkIf cfg.enable { services.printing.enable = true; };
}
