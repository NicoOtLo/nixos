{ config, pkgs, ... }:

{
  services.xserver.enable = true;



  # Your WMs
  programs.niri.enable = true;
  programs.xwayland.enable = true;
}
