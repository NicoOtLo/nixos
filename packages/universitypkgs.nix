{ config, pkgs, ... }:

{
  users.users.nico.packages = with pkgs; [
    valgrind
    dbeaver-bin
  ];
}
