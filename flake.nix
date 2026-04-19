{
  description = "NixOS from Scratch";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations.numantia = nixpkgs.lib.nixosSystem {

      system = "x86_64-linux";

      modules = [
        inputs.stylix.nixosModules.stylix
        ./default.nix

        # Other modules
        inputs.noctalia.nixosModules.default

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
