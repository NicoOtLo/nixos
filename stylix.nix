{ pkgs, ... }:

{
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    # image = ./wallpaper.jpg;
    # imageScalingMode = "fill";

    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.monoki;
        name = "Mononoki Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.source-serif;
        name = "Source Serif 4";
      };
      sizes = {
        terminal = 13;
        applications = 12;
        desktop = 11;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Amber";
      size = 24;
    };

    targets = {
      helix.enable = false;
      noctalia-shell.enable = false;

      zathura.enable = true;
      gtk.enable = true;
    };
  };
}
