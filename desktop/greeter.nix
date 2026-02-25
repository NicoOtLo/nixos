{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = false;

  # Your WMs
  programs.niri.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  programs.xwayland.enable = true;
}
