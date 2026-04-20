{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    autoLogin = {
      enable = true;
      user = "user"; # Replace with the desired user
    };
  };

  # Your WMs
  programs.niri.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  programs.xwayland.enable = true;
}
