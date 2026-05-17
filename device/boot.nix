{ pkgs, ... }:

{
  boot = {
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 20;
    };
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
