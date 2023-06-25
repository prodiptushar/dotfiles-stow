{
  description = "Home Manager configuration of prodip";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs = {
      url = "github:nix-community/nix-doom-emacs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
        
    nix-index-database = {
     url = "github:Mic92/nix-index-database"; 
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-doom-emacs, nix-index-database, ... }:
    let
      system = "x86_64-linux";
      name = "prodip";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.${name} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix 
          nix-index-database.hmModules.nix-index
          # optional to also wrap and install comma
          { programs.nix-index-database.comma.enable = true; }
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
