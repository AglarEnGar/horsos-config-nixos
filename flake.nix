{
  description = "Nixos config flake";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-flatpak, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

    };
}
