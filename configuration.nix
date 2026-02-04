{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };

  # garbage collector automation
  nix.gc = {
    automatic = true;
    persistent = false;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  networking.hostName = "numantia";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Madrid";

  services.xserver.xkb.layout = "es";

  programs.xwayland.enable = true;
  
  services.displayManager = {
    ly.enable = true;
    sessionPackages = [ 
	    pkgs.niri
    ];
  };

  programs.niri.enable = true;
  programs.zsh.enable = true;

  users.users.nico = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "lp" ]; # sudo, wifi, impresora
    shell = pkgs.zsh;
    packages = with pkgs; [
      vlc
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # IMPRESORA
  services.printing = {
    enable = true;
    drivers = [
      pkgs.gutenprint
      pkgs.hplip
      pkgs.brlaser
      pkgs.brgenml1lpr
      pkgs.brgenml1cupswrapper
    ];
  };

  # USB
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  environment.systemPackages = with pkgs; [
    helix
    dbeaver-bin
    vim
    gcc
    imagemagick
    python3
    wget
    git
    alacritty
    rofi
    thunderbird
    swaybg
    microfetch
    networkmanagerapplet
    tree
    zip
    unzip
    libnotify
    man-pages
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
      xdg-desktop-portal-wlr
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
