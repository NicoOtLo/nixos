{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./device/users.nix
    ./device/gc.nix
    ./device/virtualisation.nix
    ./device/printer.nix
    ./device/networking.nix
    ./device/region.nix
    ./device/boot.nix
    ./device/usb.nix
    ./device/bluetooth.nix
    ./device/pipewire.nix
    ./device/envvar.nix

    ./desktop/greeter.nix

    ./hardware-configuration.nix
  ];

  programs.xwayland.enable = true;

  programs.niri.enable = true;
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;
  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [
    helix
    dbeaver-bin
    vim
    valgrind
    vlc
    gcc
    imagemagick
    python3
    wget
    git
    alacritty
    rofi
    thunderbird
    swaybg
    imv
    microfetch
    networkmanagerapplet
    tree
    zip
    dig
    unzip
    libnotify
    man-pages
    element-desktop
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  # FULL DOCS
  documentation = {
    dev.enable = true;
    man.generateCaches = true;
    nixos.includeAllModules = true;
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.mononoki
    ];

    fontconfig.defaultFonts = {
      monospace = [ "mononoki" ];
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
