{ pkgs, lib, nixos-hardware, ... }:

with lib;
with lib.horizon;
{
  imports = [ ./hardware.nix ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  horizon = {
    archetypes = {
      workstation = enabled;
    };

    apps = {
      steam = enabled;
    };

    system = {
      zfs = enabled;
    };

    desktop.gnome = {
      monitors = ./monitors.xml;
    };

    hardware.audio = {
      alsa-monitor.rules = [
        (mkAlsaRename {
          name = "alsa_card.usb-Generic_Blue_Microphones_2240BAH095W8-00";
          description = "Blue Yeti";
        })
        (mkAlsaRename {
          name = "alsa_output.usb-Generic_Blue_Microphones_2240BAH095W8-00.analog-stereo";
          description = "Blue Yeti";
        })
        (mkAlsaRename {
          name = "alsa_input.usb-Generic_Blue_Microphones_2240BAH095W8-00.analog-stereo";
          description = "Blue Yeti";
        })
      ];
    };
  };

  horizon.home.extraOptions = {
    # dconf.settings = {
    #   "org/gnome/shell/extensions/just-perfection" = {
    #     panel-size = 60;
    #   };
    # };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
