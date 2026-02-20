{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    system-config-printer
  ];

  services.printing = {
    enable = true;
    drivers = [
      pkgs.gutenprint
      pkgs.hplip
      pkgs.brlaser
      pkgs.brgenml1lpr
      pkgs.brgenml1cupswrapper
    ];
  };
}
