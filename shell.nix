{ pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
    name="gumby";
    buildInputs = [
        pkgs.git
        pkgs.julia-bin
    ];
    shellHook = ''
        echo "Thank you for your contributions!"
    '';
}