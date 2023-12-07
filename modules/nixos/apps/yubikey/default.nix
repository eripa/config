{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.yubikey;
in
{
  options.horizon.apps.yubikey = with types; {
    enable = mkBoolOpt false "Whether or not to enable Yubikey.";
  };

  config = mkIf cfg.enable {
    services.yubikey-agent.enable = true;
    environment.systemPackages = with pkgs; [ yubikey-manager-qt ];
  };
}
