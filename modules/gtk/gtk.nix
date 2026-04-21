{ config, lib, pkgs, ... }:

let
  cfg = config.theming.gtk;

  themeNames = {
    dark = "Gruvbox-Dark-BL";
    light = "Gruvbox-Light-BL";
  };
in
{
  options.theming.gtk = {
    enable = lib.mkEnableOption "Gruvbox GTK theming";

    variant = lib.mkOption {
      type = lib.types.enum [ "dark" "light" ];
      default = "dark";
      description = "Gruvbox colour variant to use.";
    };

    cursorSize = lib.mkOption {
      type = lib.types.int;
      default = 24;
      description = "Cursor size in pixels.";
    };
  };

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;

      theme = {
        name = themeNames.${cfg.variant};
        package = pkgs.gruvbox-gtk-theme;
      };

      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = cfg.cursorSize;
      };

      gtk3.extraConfig.gtk-application-prefer-dark-theme = cfg.variant == "dark";
      gtk4.extraConfig.gtk-application-prefer-dark-theme = cfg.variant == "dark";
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "gtk2";
    };

    dconf.settings."org/gnome/desktop/interface" = {
      gtk-theme = themeNames.${cfg.variant};
      cursor-theme = "Bibata-Modern-Classic";
      cursor-size = cfg.cursorSize;
      color-scheme = if cfg.variant == "dark" then "prefer-dark" else "prefer-light";
    };

    home.pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = cfg.cursorSize;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
