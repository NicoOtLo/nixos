{ config, pkgs, ... }:

{
  users.users.nico = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "lp" "wireshark" "docker" "user-with-access-to-virtualbox" ]; # sudo, wifi, impresora, wireshark, docker, virtualbox
    shell = pkgs.zsh;
    packages = with pkgs; [

    ];
  };
}
