{ config, pkgs, ... }:

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
  ];
}
