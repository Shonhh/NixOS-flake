{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, ... } @inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      vm-ssd = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/vm-ssd/configuration.nix
          inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
        ];
      };
      vm-spectre = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/vm-spectre/configuration.nix
          inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
	  inputs.spicetify-nix.nixosModules.spicetify
        ];
      };
      nixossd = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nixospectre/configuration.nix
          inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
	  inputs.spicetify-nix.nixosModules.spicetify
        ];
      };
    };
  };
}
