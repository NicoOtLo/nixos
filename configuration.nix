{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./device/users.nix
    ./device/gc.nix
    ./device/virtualisation.nix
    ./device/printer.nix
    ./device/networking.nix
    ./device/region.nix
    ./device/boot.nix

    ./hardware-configuration.nix
  ];

  programs.xwayland.enable = true;

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd ${pkgs.niri}/bin/niri";
        user = "greeter";
      };
    };
  };

  programs.niri.enable = true;
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;
  programs.wireshark.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # USB
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  environment.systemPackages = with pkgs; [
    helix
    dbeaver-bin
    vim
    valgrind
    vlc
    gcc
    imagemagick
    python3
    wget
    git
    alacritty
    rofi
    thunderbird
    swaybg
    imv
    microfetch
    networkmanagerapplet
    tree
    zip
    dig
    unzip
    libnotify
    man-pages
    element-desktop
  ];

  # OBS-STUDIO
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  environment.variables = {
    XDG_CURRENT_DESKTOP = "niri";
  };

  # FULL DOCS
  documentation = {
    dev.enable = true;
    man.generateCaches = true;
    nixos.includeAllModules = true;
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.mononoki
    ];

    fontconfig.defaultFonts = {
      monospace = [ "mononoki" ];
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
