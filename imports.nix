{ ... }:

{
  imports = [
    ./device/users.nix
    ./device/gc.nix
    ./device/virtualisation.nix
    ./device/printer.nix
    ./device/region.nix
    ./device/boot.nix
    ./device/usb.nix
    ./device/bluetooth.nix
    ./device/pipewire.nix
    ./device/envvar.nix
    ./device/manuals.nix
    ./device/fonts.nix
    ./device/suspend.nix
    ./device/battery.nix
    ./packages/steam.nix
    ./device/graphics.nix

    ./desktop/greeter.nix # Sin usar

    ./packages/envpkgs.nix
    ./packages/users.nix

    ./hardware-configuration.nix
  ];
}
