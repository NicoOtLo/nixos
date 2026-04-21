{ config, lib, pkgs, ... }:

let
  cfg = config.theming.gtkGruvbox;
in
{
  options.theming.gtkGruvbox = {
    enable = lib.mkEnableOption "Gruvbox GTK theming";

    variant = lib.mkOption {
      type = lib.types.enum [ "dark" "light" ];
      default = "dark";
      description = "Gruvbox variant";
    };
  };

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;

      theme = {
        name = "Gruvbox-Dark-BL";
        package = pkgs.gruvbox-gtk-theme;
      };

      iconTheme = {
        name = "Gruvbox-Plus-Dark";
        package = pkgs.gruvbox-plus-icons;
      };

      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
      };

      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };

      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };

    # Optional: Qt apps consistency
    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "gtk2";
    };
  };
}
