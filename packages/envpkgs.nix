{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zip
    upower
    git
    libnotify
    vlc
    helix
    tree
    vim
    gcc
    python3
  ];
}
