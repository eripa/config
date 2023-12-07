{
  config,
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
  time.timeZone = "America/Vancouver";

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sdhci_acpi"];
  boot.kernelParams = [];
  boot = {
    # zfs cannot use latest kernel
    # kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [];
  };

  # rpool/nixos/root / zfs x-initrd.mount,X-mount.mkdir,noatime 0 0
  # bpool/nixos/root /boot zfs x-initrd.mount,X-mount.mkdir,noatime 0 0
  # /dev/disk/by-id/nvme-SSD_256GB_202308310802-part1 /boot/efis/nvme-SSD_256GB_202308310802-part1 vfat x-systemd.idle-timeout=1min,x-systemd.automount,noauto,nofail,noatime,X-mount.mkdir 0 2
  # rpool/nixos/home /home zfs x-initrd.mount,X-mount.mkdir,noatime 0 0
  # rpool/nixos/var/lib /var/lib zfs x-initrd.mount,X-mount.mkdir,noatime 0 0
  # rpool/nixos/var/log /var/log zfs x-initrd.mount,X-mount.mkdir,noatime 0 0

  fileSystems = {
    "/" = {
      device = "rpool/nixos/root";
      fsType = "zfs";
    };

    "/boot/efis/nvme-SSD_256GB_202308310802-part1" = {
      device = "/dev/disk/by-id/nvme-SSD_256GB_202308310802-part1";
      fsType = "vfat";
    };

    "/boot" = {
      device = "bpool/nixos/root";
      fsType = "zfs";
    };

    "/home" = {
      device = "rpool/nixos/home";
      fsType = "zfs";
    };

    "/var/lib" = {
      device = "rpool/nixos/var/lib";
      fsType = "zfs";
    };

    "/var/log" = {
      device = "rpool/nixos/var/log";
      fsType = "zfs";
    };
  };

  swapDevices = [{device = "/dev/mapper/dev-disk-byx2did-nvmex2dSSD_256GB_202308310802x2dpart4";}];

  # NOTE: NetworkManager will handle DHCP.
  networking.interfaces.eno1.useDHCP = false;
  networking.interfaces.wlp1s0.useDHCP = false;

  hardware.enableRedistributableFirmware = true;

  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.bluetooth.enable = true;
}
