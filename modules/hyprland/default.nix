{
  pkgs,
  lib,
  imports,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./hyprpaper.nix
    ./hyprlock.nix
  ];
}
