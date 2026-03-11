{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.displayManager.lightdm.enable = false;
  services.displayManager.gdm.enable = false;
  services.displayManager.sddm = {
    enable = true;
    extraPackages = with pkgs; [
      where-is-my-sddm-theme
    ];

    theme = "where-is-my-sddm-theme";
  };

  # Your WMs
  programs.niri.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  programs.xwayland.enable = true;
}
