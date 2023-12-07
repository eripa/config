{ lib, pkgs, config, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.tools.fup-repl;
  fup-repl = pkgs.writeShellScriptBin "fup-repl" ''
    ${pkgs.fup-repl}/bin/repl ''${@}
  '';
in
{
  options.horizon.tools.fup-repl = with types; {
    enable = mkBoolOpt false "Whether to enable fup-repl or not";
  };

  config = mkIf cfg.enable { environment.systemPackages = [ fup-repl ]; };
}
