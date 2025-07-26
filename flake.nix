{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprpaper.url = "github:hyprwm/hyprpaper";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        ];
      };
    };
  };
}
