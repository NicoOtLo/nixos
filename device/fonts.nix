{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.mononoki
    ];

    fontconfig.defaultFonts = {
      monospace = [ "mononoki" ];
    };
  };
}
