{ config
, pkgs
, lib
, ...
}:

{
  gtk = {
    enable = true;

    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-dark-gtk;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  home.packages = with pkgs; [
    gruvbox-gtk-theme
    papirus-icon-theme
    bibata-cursors
  ];

  home.sessionVariables = {
    GTK_USE_PORTAL = "1";
    XDG_SESSION_TYPE = "wayland";
  };
}

