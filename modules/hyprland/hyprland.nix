{ config
, pkgs
, ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      $mod = SUPER

      bind = $mod, RETURN, exec, kitty
      bind = $mod, Q, killactive
      bind = $mod, D, exec, rofi -show drun

      general {
        gaps_in = 5
        gaps_out = 10
      }
    '';
  };
}
