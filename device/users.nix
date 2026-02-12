{ config, pkgs, ... }:

{
  users.users.nico = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "lp" "wireshark" "docker" ]; # sudo, wifi, impresora, wireshark, docker
    shell = pkgs.zsh;
    packages = with pkgs; [

    ];
  };
}
