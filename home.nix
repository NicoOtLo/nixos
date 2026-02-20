{ config, pkgs, ... }:

{
  imports = [
    ./modules/zathura/zathura.nix
    ./modules/waybar
    ./modules/niri/niri.nix
    ./modules/kitty/kitty.nix
    ./modules/helix/helix.nix
    ./modules/fastfetch/fastfetch.nix
    ./modules/starship/starship.nix
    ./modules/gtk/gtk.nix
    ./modules/hyprland/hyprland.nix
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
      la = "eza -lha";
      y = "yazi";
      c = "clear";
      nixos = "cd /etc/nixos";
      nurse = "sudo nixos-rebuild switch --flake /etc/nixos#numantia";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake /etc/nixos#numantia";
    };
  };

  home.packages = with pkgs; [
    eza
    bat
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
    ocamlPackages.utop
    ocaml
    clang-tools
    jetbrains.idea-oss
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
  ];
}
