{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  programs.niri.enable = true;
  programs.xwayland.enable = true;
}
