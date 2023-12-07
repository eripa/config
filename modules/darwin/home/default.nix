{ options, config, pkgs, lib, inputs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.home;
in
{
  # imports = with inputs; [
  #   home-manager.darwinModules.home-manager
  # ];

  options.horizon.home = with types; {
    file = mkOpt attrs { }
      "A set of files to be managed by home-manager's <option>home.file</option>.";
    configFile = mkOpt attrs { }
      "A set of files to be managed by home-manager's <option>xdg.configFile</option>.";
    extraOptions = mkOpt attrs { } "Options to pass directly to home-manager.";
    homeConfig = mkOpt attrs { } "Final config for home-manager.";
  };

  config = {
    horizon.home.extraOptions = {
      home.stateVersion = mkDefault "22.11";
      home.file = mkAliasDefinitions options.horizon.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.horizon.home.configFile;
    };

    snowfallorg.user.${config.horizon.user.name}.home.config = mkAliasDefinitions options.horizon.home.extraOptions;

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;

      # users.${config.horizon.user.name} = args:
      #   mkAliasDefinitions options.horizon.home.extraOptions;
    };
  };
}
