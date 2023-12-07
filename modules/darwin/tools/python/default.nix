{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.tools.python;
in
{
  options.horizon.tools.python = with types; {
    enable = mkBoolOpt false "Whether or not to enable Python.";
  };

  config =
    mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        (python311.withPackages (ps:
          with ps; [
            numpy
          ])
        )
      ];
    };
}
