{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.tools.java;
in
{
  options.horizon.tools.java = with types; {
    enable = mkBoolOpt false "Whether or not to enable Java.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      jdk
    ];
  };
}
