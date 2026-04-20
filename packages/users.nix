{ inputs, nixpkgs, ... }:

{
  users.users.nico.packages = [
  ];

  nixpkgs.config.allowUnfree = true;
}
