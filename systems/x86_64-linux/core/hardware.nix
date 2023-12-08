{
  config,
  pkgs,
  lib,
  modulesPath,
  inputs,
  ...
}: let
  inherit (inputs) nixos-hardware;
in {
  imports = with nixos-hardware.nixosModules; [
    (modulesPath + "/installer/scan/not-detected.nix")
    common-cpu-amd
    common-gpu-amd
    common-pc
    common-pc-ssd
  ];

  networking.hostId = "e5361c48";
  networking.hostName = "core";

  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_testing;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sdhci_acpi" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "UUID=7936f718-161b-48c7-9e47-3022db1daae0";
      fsType = "bcachefs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/12CE-A600";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/9a235ead-c7a9-4204-943e-9359bce46ec8"; }
    ];

  # NOTE: NetworkManager will handle DHCP.
  networking.interfaces.eno1.useDHCP = false;
  networking.interfaces.wlp1s0.useDHCP = false;

  hardware.enableRedistributableFirmware = true;

  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.bluetooth.enable = true;
}
