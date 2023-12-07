{ options, config, pkgs, lib, inputs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.home;
in
{
  # imports = with inputs; [
  #   home-manager.nixosModules.home-manager
  # ];

  options.horizon.home = with types; {
    file = mkOpt attrs { }
      (mdDoc "A set of files to be managed by home-manager's `home.file`.");
    configFile = mkOpt attrs { }
      (mdDoc "A set of files to be managed by home-manager's `xdg.configFile`.");
    extraOptions = mkOpt attrs { } "Options to pass directly to home-manager.";
  };

  config = {
    horizon.home.extraOptions = {
      home.stateVersion = config.system.stateVersion;
      home.file = mkAliasDefinitions options.horizon.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.horizon.home.configFile;
    };

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;

      users.${config.horizon.user.name} =
        mkAliasDefinitions options.horizon.home.extraOptions;
    };
  };
}
