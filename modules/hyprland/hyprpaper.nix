{ pkgs, ... }: {
  home.packages = with pkgs; [ hyprpaper ];
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "off";
      splash = false;
      splash_offset = 2.0;

      preload = [ "/etc/nixos/modules/hyprland/wallpapers/naboo.jpg" "/etc/nixos/modules/hyprland/wallpapers/coruscant.jpg" "/etc/nixos/modules/hyprland/wallpapers/death_star.png" ];

      wallpaper = [
        "DP-2,/etc/nixos/hyprland/wallpapers/death_star.png"
        "eDP-1,/etc/nixos/hyprland/wallpapers/death_star.png"
        "HDMI-A-1,~/.nixos-conf/modules/desktop/hypr/wallpapers/death_star.png"
      ];
    };
  };
}
