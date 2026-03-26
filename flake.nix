{
  description = "Something cute and kind, with heart";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          # NOTE(jcowling): I was reading 'NeuroTribes' by Steve Silberman
          # and discovered that Perl is named after the Parable of the Pearl
          # of Great Price from the Gospel of Matthew.
          #
          # "The kingdom of heaven is like a merchant seeking beautiful pearls,
          # who, when he had found one pearl of great price, went and sold all
          # that he had and bought it"
          #   
          # I am not sure why but it has really stuck with me, and it has
          # made me want to use Perl at somepoint in this project. Hence,
          # I am leaving this here. 
          pkgs.perl
        ];
      };
    };
}
