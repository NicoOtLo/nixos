{ pkgs, inputs, ... }:

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

  home.sessionVariables = {
    GTK_THEME = "Gruvbox-Dark";
    GTK_ICON_THEME = "Papirus-Dark";
  };

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
      plugins = [ "git" "colored-man-pages" "eza" "fzf" ];
    };

    shellAliases = {
      la = "ls -lha";
      ll = "ls -lh";
      y = "yazi";
      c = "clear";
    };
  };

  home.packages = with pkgs; [
    superTuxKart
    drawio
    xfce.thunar
    networkmanagerapplet
    pavucontrol
    wlogout
    libreoffice-qt-fresh
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
    zathura
    xwayland-satellite
    niri
    swaylock
    waybar
    ani-cli
    wireshark
    mindustry-wayland
    imagemagick
    quickshell
    thunderbird
    swaybg
    imv
    microfetch
    dig
    unzip
    libnotify
    sqlite
    gnumake
    beam28Packages.erlang
    erlang-language-platform
    gruvbox-gtk-theme
    papirus-icon-theme
    gimp
    hyprpicker
    eza
    fzf
  ];
}
