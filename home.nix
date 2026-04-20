{ pkgs, lib, ... }:

{
  imports = [
    ./modules/zathura/zathura.nix
    ./modules/niri/niri.nix
    ./modules/kitty/kitty.nix
    ./modules/helix/helix.nix
  ];

  home.username = "nico";
  home.homeDirectory = "/home/nico";
  home.stateVersion = "25.05"; # no tocar

  programs.git = {
    enable = true;

    settings.user = {
      name = "NicoOtLo";
      email = "nicolasoterolopez@gmail.com";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    shellAliases = {
      la = "ls -lha";
      ll = "ls -lh";
      y = "yazi";
      c = "clear";
      nixos = "cd /etc/nixos";
      nurse = "sudo nixos-rebuild switch --flake /etc/nixos#numantia";
    };
  };

  home.packages = with pkgs; [
    htop
    xfce.thunar
    networkmanagerapplet
    pavucontrol
    wlogout
    libreoffice-qt-fresh
    scid-vs-pc
    stockfish
    tldr
    steam
    valgrind
    dbeaver-bin
    ocamlPackages.utop
    ocaml
    clang-tools
    jetbrains.idea-oss
    jdk
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    dia
    yazi
    fastfetch
    speedcrunch
    zathura
    xwayland-satellite
    niri
    swaylock
    waybar
    ani-cli
    wireshark
    mindustry-wayland
    nbsdgames
    imagemagick
    quickshell
    alacritty
    rofi
    thunderbird
    swaybg
    imv
    microfetch
    dig
    unzip
    mdcat
    libnotify
    sqlite
    gnumake
    beam28Packages.erlang
    erlang-language-platform
    gimp
  ];
}
