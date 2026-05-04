{ inputs, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zip
    git
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
    system-config-printer
    nh
  ];
}
