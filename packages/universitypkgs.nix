{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    valgrind
    dbeaver-bin
  ];
}
