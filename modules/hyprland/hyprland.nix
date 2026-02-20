{ pkgs, ... }: {
  home.packages = [ pkgs.rose-pine-hyprcursor ]; #Cursor's package set by hyprctl
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = [
        "eDP-1,auto,auto,auto"
      ];

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      input = {
        kb_layout = "es";
      };

      general = {
        "$mod" = "SUPER";
        layout = "dwindle";
        gaps_in = 0;
        gaps_out = 0;
        border_size = 2;
        no_border_on_floating = false;
      };

      misc = {
        disable_hyprland_logo = true;
      };

      exec-once = [
        "uwsm app -- waybar"
        "uwsm app -- hyprpaper"
        "uwsm app -- mako"
        "wl-paste --watch cliphist store"
      ];

      bind =
        [
          "$mod, Q, exec,uwsm app -- kitty"
          "$mod, F, exec,uwsm app -- firefox"
          "$mod, Space, exec, uwsm app -- vicinae toggle"
          "$mod CONTROL SHIFT,L,exec, hyprlock"

          "$mod, C, killactive"
          "$mod, V, togglefloating"
        ]
        ++ (
          # Workspaces con genList
          builtins.concatLists (
            builtins.genList
              (
                i:
                let
                  ws = i + 1;
                in
                [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              )
              9
          )
        )
        ++ (
          # Window focus, movement and control
          builtins.concatLists (
            let
              keys = [
                "H"
                "L"
                "K"
                "J"
              ];
              directions = [
                "l"
                "r"
                "u"
                "d"
              ];
              resize = toString 80; # Change this to change how much a window resizes each keypress
              resize_list = [
                "-${resize} 0"
                "${resize} 0"
                "0 -${resize}"
                "0 ${resize}"
              ];
            in
            builtins.genList
              (
                x:
                let
                  k = builtins.elemAt keys x;
                  d = builtins.elemAt directions x;
                  r = builtins.elemAt resize_list x;
                in
                [
                  "$mod, ${k}, movefocus, ${d}"
                  "$mod SHIFT, ${k}, movewindow, ${d}"
                  "$mod CTRL, ${k}, resizeactive, ${r}"
                  "$mod ALT, ${k}, moveactive, ${r}"
                ]
              )
              4
          )
        );

      # Mouse binding
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
