{
  description = "NixOS from Scratch";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    minecraft = {
      url = "github:hero-persson/FjordLauncherUnlocked";
    };
  };

  outputs = { self, nixpkgs, home-manager, noctalia, minecraft, ... }@inputs: {

    nixosConfigurations.numantia = nixpkgs.lib.nixosSystem {

      system = "x86_64-linux";

      modules = [
        ./default.nix

        # Other modules

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.nico = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];

      specialArgs = { inherit inputs; };
    };
  };
}
