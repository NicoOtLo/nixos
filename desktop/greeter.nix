{ config, pkgs, ... }:

{
  programs.niri.enable;
  programs.xwayland.enable;

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd ${pkgs.niri}/bin/niri";
        user = "greeter";
      };
    };
  };
}
