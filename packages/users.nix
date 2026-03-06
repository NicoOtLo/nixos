{ inputs, ... }:

{
  users.users.nico.packages = [
    inputs.noctalia.packages.x86_64-linux.default # Debido a que no funciona en home.nix
  ];

  nixpkgs.config.allowUnfree = true;
}
