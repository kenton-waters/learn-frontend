{
  description = "Learning HTML, CSS, TypeScript, React, Svelte, and more!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system; config.allowUnfree = true;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShellNoCC {
        buildInputs = with pkgs; [
          google-chrome

          (vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
              jnoortheen.nix-ide
              esbenp.prettier-vscode
            ];
          })
        ];

        shellHook = ''
          
        '';
      };
    };
}