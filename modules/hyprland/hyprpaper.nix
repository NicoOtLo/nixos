{pkgs, ...}: {
  home.packages = with pkgs; [hyprpaper];
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "off";
      splash = false;
      splash_offset = 2.0;

      preload = ["~/.nixos-conf/modules/desktop/hypr/wallpapers/naboo.jpg" "~/.nixos-conf/modules/desktop/hypr/wallpapers/coruscant.jpg" "~/.nixos-conf/modules/desktop/hypr/wallpapers/death_star.png"];

      wallpaper = [
        "DP-2,~/.nixos-conf/modules/desktop/hypr/wallpapers/death_star.png"
        "HDMI-A-1,~/.nixos-conf/modules/desktop/hypr/wallpapers/death_star.png"
      ];
    };
  };
}
