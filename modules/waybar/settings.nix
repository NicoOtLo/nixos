{ host
, pkgs
, ...
}: {
  home.packages = with pkgs; [ pavucontrol ];
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 28;
    spacing = 4;
    modules-left = [
      "hyprland/workspaces"
      "custom/sep"
      "hyprland/window"
      "custom/sep"
    ];
    modules-center = [ ];
    modules-right = [
      "custom/sep"
      "custom/clipboard"
      "custom/sep"
      "network"
      "custom/sep"
      "cpu"
      "custom/sep"
      "memory"
      "custom/sep"
      "disk"
      "custom/sep"
      "pulseaudio"
      "custom/sep"
      "clock"
      "custom/sep"
      "tray"
      "battery"
    ];
    "custom/clipboard" = {
      on-click = "vicinae vicinae://extensions/vicinae/clipboard/history";
      format = "Clipboard";
    };
    "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
      warp-on-scroll = false;
      swap-icon-laberl = false;
      format = "{name}";
      persistent-workspaces = {
        "*" = 9;
      };
    };
    "hyprland/window" = {
      max-length = 40;
      seperate-outputs = false;
    };
    tray = {
      spacing = 10;
    };
    clock = {
      format-alt = "{:%Y-%m-%d}";
    };
    cpu = {
      format = "CPU: {usage}%";
      tooltip = false;
    };
    memory = {
      format = "Mem: {used}GiB";
    };
    disk = {
      interval = 60;
      path = "/";
      format = "Disk: {free}";
    };
    battery = {
      states = {
        good = 95;
        warning = 30;
        critical = 15;
      };
      format = "Bat: {capacity}% {icon} {time}";
      format-plugged = "{capacity}% ";
      format-alt = "Bat {capacity}%";
      format-time = "{H}:{M}";
      format-icons = [ "" "" "" "" "" ];
    };
    network = {
      format = "Online";
      format-disconnected = "Disconnected ⚠";
      on-click = "vicinae vicinae://extensions/vicinae/wifi-commander";
    };
    pulseaudio = {
      format = "{volume}% {icon}";
      format-bluetooth = "{volume}% {icon}";
      format-muted = "";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        phone-muted = "";
        portable = "";
        car = "";
        default = [ "" "" ];
      };
      scroll-step = 1;
      on-click = "pavucontrol";
      ignored-sinks = [ "Easy Effects Sink" ];
    };
    "custom/sep" = {
      format = "|";
      interval = 0;
    };
  };
}
