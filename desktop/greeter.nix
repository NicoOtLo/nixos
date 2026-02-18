{ config, pkgs, ... }:

{
  # Enable X11 (LightDM needs X)
  services.xserver.enable = true;

  # Enable LightDM
  services.xserver.displayManager.lightdm.enable = true;

  # Disable greetd so they don't fight
  services.greetd.enable = false;

  # Make sure other DMs are off
  services.xserver.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = false;

  # Your WMs
  programs.niri.enable = true;
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;
}
