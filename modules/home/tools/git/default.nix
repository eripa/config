{ lib, config, pkgs, ... }:

let
  inherit (lib) types mkEnableOption mkIf;
  inherit (lib.horizon) mkOpt enabled;

  cfg = config.horizon.tools.git;
  user = config.horizon.user;
in
{
  options.horizon.tools.git = {
    enable = mkEnableOption "Git";
    userName = mkOpt types.str user.fullName "The name to configure git with.";
    userEmail = mkOpt types.str user.email "The email to configure git with.";
    signingKey =
      mkOpt types.str "9762169A1B35EA68" "The key ID to sign commits with.";
    signByDefault = mkOpt types.bool true "Whether to sign commits by default.";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      inherit (cfg) userName userEmail;
      lfs = enabled;
      signing = {
        key = cfg.signingKey;
        inherit (cfg) signByDefault;
      };
      extraConfig = {
        init = { defaultBranch = "main"; };
        pull = { rebase = true; };
        push = { autoSetupRemote = true; };
        core = { whitespace = "trailing-space,space-before-tab"; };
        safe = {
          directory = "${user.home}/work/config";
        };
      };
    };
  };
}
