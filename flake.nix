{
  description = "A Flake For Skyrim Accessibility Mod By Dio Kyrie";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
    papyrus-compiler.url = "github:russo-2025/papyrus-compiler";
  };
  outputs = { self, nixpkgs, flake-utils, papyrus-compiler }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          system = system;
          config.allowUnfree = true;
          config.microsoftVisualStudioLicenseAccepted = true;
        };
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "SkyrimAccessibility";
          version = "1.0.0";
          # Sources
          src = (./.);
          sourceRoot = "pname"; # Build starts in parent directory of all source directories.
          buildPhase = ''
            papyrus-compiler compile -h "./lib/skse/scripts/vanilla/" -h "./lib/skse/scripts/modified/" -h "./lib/papyrus-extender/Papyrus/Source/scripts/" -h "./lib/papyrus-extender-tweaks/Skyrim/Data/source/scripts/" -h "./lib/db-skse-functions/DbSkseFunctions/Papyrus/Scripts/Source/" -h "./lib/papyrus-util/Scripts/Source/" -h "./lib/skyui-community/source/scripts/" -i "./Skyrim Data/Scripts/Source/" -o "./Skyrim Data/Scripts/"
          '';
          nativeBuildInputs = with pkgs; [
          papyrus-compiler.packages.${system}.default
          #xmake
          ];
        };
        # Development shell with tools for hacking on the package
        # Enter with `nix develop`
        devShells.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.default ];
          shellHook = ''
            export PS1="$PS1[nix develop]:"
            echo "Welcome to the dev shell."
            echo "Build the package with: nix build .#default"
          '';
        };
      });
}

# Use command bellow to compile .psc files. Update to include 2 outpus and multiple header folders.
# papyrus-compiler compile -h "/home/cubozoa/Games/Skyrim Special Edition/Data/Scripts/Source/" -i "./Skyrim Data/Scripts/Source/" -o "./Skyrim Data/Scripts/"
