{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.apps.bottles;
in
{
  options.horizon.apps.bottles = with types; {
    enable = mkBoolOpt false "Whether or not to enable Bottles.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ bottles ]; };
}
