{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.horizon; let
  cfg = config.horizon.system.fonts;
in {
  options.horizon.system.fonts = with types; {
    enable = mkBoolOpt false "Whether or not to manage fonts.";
    fonts = mkOpt (listOf package) [] "Custom font packages to install.";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      # Enable icons in tooling since we have nerdfonts.
      LOG_ICONS = "true";
    };

    environment.systemPackages = with pkgs; [font-manager];

    fonts.packages = with pkgs;
      [
        jetbrains-mono
        source-code-pro
        commit-mono
        (nerdfonts.override {fonts = ["FiraCode"];})
      ]
      ++ cfg.fonts;
  };
}
