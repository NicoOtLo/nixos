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

    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: {

    nixosConfigurations.numantia = nixpkgs.lib.nixosSystem {

      system = "x86_64-linux";

      modules = [
        stylix.nixosModules.stylix
        ./default.nix

        # Other modules
        ./noctalia.nix
        ./stylix.nix

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
