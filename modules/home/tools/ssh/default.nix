{ lib, config, pkgs, ... }:

let
  inherit (lib) types mkEnableOption mkIf;
  cfg = config.horizon.tools.ssh;
in
{
  options.horizon.tools.ssh = {
    enable = mkEnableOption "SSH";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      extraConfig = ''
        Host *
          HostKeyAlgorithms +ssh-rsa
      '';
    };
  };
}
