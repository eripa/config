{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.frappe-books;
in
{
  options.horizon.apps.frappe-books = with types; {
    enable = mkBoolOpt false "Whether or not to enable FrappeBooks.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ horizon.frappe-books ];
  };
}
