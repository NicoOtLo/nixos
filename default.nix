{ pkgs, ... }:

{
  imports = [
    ./imports.nix
  ];

  programs.xwayland.enable = true;

  programs.zsh.enable = true;

  hardware.enableAllFirmware = true;

  networking.networkmanager.enable = true;

  services.upower.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
