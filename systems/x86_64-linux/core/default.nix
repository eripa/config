{
  pkgs,
  config,
  lib,
  channel,
  ...
}:
with lib;
with lib.horizon; {
  imports = [./hardware.nix];
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  networking.firewall = {
    allowedTCPPorts = [22];
  };

  environment.systemPackages = with pkgs; [
    chromium
    horizon.kalidoface
    deluge
  ];

  horizon = {
    apps = {};

    user.prompt-init = false;

    archetypes = {
      workstation = enabled;
    };

    desktop.gnome = {
      wallpaper = {
        light = pkgs.horizon.wallpapers.nord-rainbow-light-nix-ultrawide;
        dark = pkgs.horizon.wallpapers.nord-rainbow-dark-nix-ultrawide;
      };
      # monitors = ./monitors.xml;
    };
  };

  # WiFi is typically unused on the desktop. Enable this service
  # if it's no longer only using a wired connection.
  systemd.services.network-addresses-wlp1s0.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
