{ lib, pkgs, ... }:

with lib.horizon;
{
  horizon = {
    suites = {
      common = enabled;
      development = enabled;
    };

    desktop.yabai = enabled;
  };

  environment.systemPath = [
    "/opt/homebrew/bin"
  ];

  system.stateVersion = 4;
}
