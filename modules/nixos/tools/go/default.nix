{ options, config, pkgs, lib, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.tools.go;
in
{
  options.horizon.tools.go = with types; {
    enable = mkBoolOpt false "Whether or not to enable Go support.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ go gopls ];
      sessionVariables = {
        GOPATH = "$HOME/work/go";
      };
    };
  };
}
