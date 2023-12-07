{ options, config, pkgs, lib, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.hardware.fingerprint;
in
{
  options.horizon.hardware.fingerprint = with types; {
    enable = mkBoolOpt false "Whether or not to enable fingerprint support.";
  };

  config = mkIf cfg.enable { services.fprintd.enable = true; };
}
