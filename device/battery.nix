{ ... }:

{
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

  powerManagement.cpuFreqGovernor = "schedutil";
}
