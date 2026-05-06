{ pkgs, ... }:

{
  imports = [
    ./device/users.nix
    ./device/gc.nix
    ./device/virtualisation.nix
    ./device/printer.nix
    ./device/region.nix
    ./device/boot.nix
    ./device/usb.nix
    ./device/bluetooth.nix
    ./device/pipewire.nix
    ./device/envvar.nix
    ./device/manuals.nix
    ./device/fonts.nix
    ./device/suspend.nix

    ./desktop/greeter.nix # Sin usar

    ./packages/envpkgs.nix
    ./packages/users.nix

    ./hardware-configuration.nix
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

  system.stateVersion = "25.11";
}
