{ config, lib, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.cache.public;
in
{
  options.horizon.cache.public = {
    enable = mkEnableOption "Beyond the Horizon public cache";
  };

  config = mkIf cfg.enable {
    horizon.nix.extra-substituters = {
      "https://attic.ruby.hamho.me/public".key = "public:QUkZTErD8fx9HQ64kuuEUZHO9tXNzws7chV8qy/KLUk=";
    };
  };
}
