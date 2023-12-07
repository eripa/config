{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.apps.vscode;
in
{
  options.horizon.apps.vscode = with types; {
    enable = mkBoolOpt false "Whether or not to enable vscode.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ vscode ]; };
}
