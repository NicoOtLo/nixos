{ config, pkgs, ... }:

{
  # IMPRESORA
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
