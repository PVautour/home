{
  description = "Home Manager configuration using flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    let
      system = "x86_64-linux"; # Adjust to your system if different
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeConfigurations.pv = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [ ./home.nix ];
      };
    };
}
