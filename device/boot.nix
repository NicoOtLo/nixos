{ pkgs, ... }:

{
  boot = {
    loader.grub.enable = false;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_zen;
    # kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "loglevel=4" # cuanta info 0-7
      "debug" # info
      "initcall_debug" # muestra tiempos
    ];
  };

  networking.hostName = "Numancia";
}
