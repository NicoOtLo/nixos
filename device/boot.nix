{ pkgs, ... }:

{
  boot = {
    loader.grub.enable = false;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_zen;
    # kernelPackages = pkgs.linuxPackages_latest;

    kernel.sysctl."vm.swappiness" = 10;
    # when to swap:
    # 0 never
    # 10-30 conservative
    # 60 default
    # 100 aggresively (útil para multitasking aparentemente)

    kernelParams = [
      "loglevel=4" # cuanta info 0-7
      "debug" # info
      "initcall_debug" # muestra tiempos
      "elevator=none" # disables I/O scheduling
    ];
  };

  networking.hostName = "Numancia";

  powerManagement.cpuFreqGovernor = "schedutil";
  # performance / powesave / schedutil

  zramSwap.enable = true; # compresses memory instead of swapping [swap type]
}
