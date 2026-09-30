{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;

  programs.niri.enable = true;
  programs.mango.enable = true;
  programs.xwayland.enable = true;
}
