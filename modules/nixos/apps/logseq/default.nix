{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.apps.logseq;
in
{
  options.horizon.apps.logseq = with types; {
    enable = mkBoolOpt false "Whether or not to enable logseq.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ logseq ]; };
}
