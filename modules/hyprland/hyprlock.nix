{config, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      background = {
        path = "screenshot";
        blur_passes = 3;
      };

      label = [
        # Time
        {
          text = "cmd[update:30000] echo \"<b><big> $(date +\"%R\") </big></b>\"";
          color = "rgb(0,0,0,1)";
          font_size = 110;
          shadow_passes = 3;
          shadow_size = 3;

          position = "0, -100";
          halign = "center";
          valign = "top";
        }

        # Date
        {
          text = "cmd[update:43200000] echo \"$(date +\"%A, %d %B %Y\")\"";
          color = "rgb(0,0,0,1)";
          font_size = 18;
          position = "0, -300";
          halign = "center";
          valign = "top";
        }
      ];

      input-field = {
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.4;
        dots_center = true;
        inner_color = "rgba(255,255,255,0.6)";
        rounding = 0;
        fade_on_empty = false;
        placeholder_text = "<span foreground=\"##000000\"><i>󰌾  Logged in as </i><span foreground=\"##000000\">$USER</span></span>";
        hide_input = false;
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = "rgb(255,0,0,1)";
        position = "0, -100";
        halign = "center";
        valign = "center";
      };
    };
  };
}
