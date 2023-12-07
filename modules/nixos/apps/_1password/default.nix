{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps._1password;
in
{
  options.horizon.apps._1password = with types; {
    enable = mkBoolOpt false "Whether or not to enable 1password.";
  };

  config = mkIf cfg.enable {
    programs = {
      _1password = enabled;
      _1password-gui = {
        enable = true;

        polkitPolicyOwners = [ config.horizon.user.name ];
      };
    };
  };
}
