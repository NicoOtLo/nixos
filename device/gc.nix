{
  # garbage collector automation
  nix.gc = {
    automatic = true;
    persistent = false;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };
}
