{ inputs, pkgs, ... }:

{
  users.users.nico.packages = [
    inputs.noctalia.packages.x86_64-linux.default
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.minecraft.packages.${pkgs.system}.default
  ];

  nixpkgs.config.allowUnfree = true;
}
