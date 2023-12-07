{ lib, config, pkgs, host ? null, format ? "unknown", ... }:

let
  inherit (lib) types;
  inherit (lib.horizon) mkOpt;
in
{
  options.horizon.host = {
    name = mkOpt (types.nullOr types.str) host "The host name.";
  };
}
