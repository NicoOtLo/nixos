{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      # shell tmux;
      confirm_os_window_close = 0;
      font_familiy = "mononoki";
      font_size = 12.0;

      cursor_shape = "block";
      cursor_blink = "on";

      background = "#2E2E2E";
      background_opacity = 0.5;

      foreground = "#EDEDED";

      color0 = "#7B6F72";
      color1 = "#F48FB1";
      color2 = "#A5D6A7";
      color3 = "#FFD180";
      color4 = "#90CAF9";
      color5 = "#CE93D8";
      color6 = "#80DEEA";
      color7 = "#E0E0E0";
      
      color8 = "#5D4C50";
      color9 = "#F06292";
      color10 = "#81C784";
      color11 = "#FFB74D";
      color12 = "#64B5F6";
      color13 = "#BA68C8";
      color14 = "#4DD0E1";
      color15 = "#FFFFFF";
      
      selection_foreground = "#2E2E2E";
      selection_background = "#A3A3A3";
      
      window_padding_width = 12;
      
      enable_audio_bell = "no";
    };
  };
}
