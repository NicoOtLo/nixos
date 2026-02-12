{
  lib,
  config,
  ...
}: {
  programs.waybar.style = ''
    @define-color bg    rgba(30,30,30,0.6);
    @define-color fg    #bbbbbb;
    @define-color blk   #32344a;
    @define-color red   #f7768e;
    @define-color grn   #9ece6a;
    @define-color ylw   #e0af68;
    @define-color blu   #7aa2f7;
    @define-color mag   #ad8ee6;
    @define-color cyn   #0db9d7;
    @define-color brblk #2a2a2a;
    @define-color white #ffffff;

    * {
        font-family: "firacode nerd font", monospace;
        font-size: 12px;
    }

    window#waybar {
        background-color: @bg;
        color: @fg;

    }

    #workspaces button {
        padding: 0 6px;
        color: @blu;
        background: transparent;
    }
    #workspaces button.active {
        color: @blu;
        border-bottom: 3px solid @blu;
    }
    #workspaces button.empty {
        color: @white;
    }
    #workspaces button.empty.active {
        color: @blu;
        border-bottom: 3px solid @blu;
    }

    #workspaces button.urgent {
        background-color: @red;
    }

    button:hover {
        background: inherit;
        box-shadow: inset 0 -3px #ffffff;
    }

    #clock,
    #custom-sep,
    #battery,
    #cpu,
    #memory,
    #disk,
    #network,
    #custom-clipboard,
    #pulseaudio,
    #tray {
        padding: 0 8px;
        color: @white;
    }

    #custom-sep {
        color: @brblk;
    }

    #clock {
        color: @white;
    }

    #battery {
        color: @white;
    }

    #disk {
        color: @white;
    }

    #memory {
        color: @white;
    }

    #cpu {
        color: @white;
    }

    #network {
        color: @white;
    }

    #network.disconnected {
        background-color: @red;
    }

    #tray {
        background-color: #2980b9;
    }

  '';
}
