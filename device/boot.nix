{ pkgs, ... }:

{
  boot = {
    loader.grub.enable = false;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "loglevel=4"
      "debug"
      "initcall_debug"
    ];
  };

  networking.hostName = "Numancia";

  powerManagement.cpuFreqGovernor = "schedutil";
  # performance / powesave / schedutil
}
