{ config, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.stylix.overlays.default
  ];

  stylix = {
    enable = true;
    targets.home-manager.enable = true;
  };
}
