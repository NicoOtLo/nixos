{ inputs, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zip
    git
    libnotify
    vlc
    helix
    tree
    vim
    gcc
    python3
    networkmanagerapplet
    wget
    man-pages
    element-desktop
    vicinae
    system-config-printer
  ];
}
