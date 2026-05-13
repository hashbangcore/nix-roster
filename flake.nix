{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    roster-src = {
      url = "git+https://git.bugsy.cz/beval/roster.git";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      roster-src,
    }:
    let
      shortDesc = "HTTP client for API testing";
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        description = shortDesc;

        packages = {
          default = pkgs.stdenv.mkDerivation {
            pname = "roster";
            version = "0.8.3";

            src = roster-src;

            nativeBuildInputs = with pkgs; [
              meson
              ninja
              pkg-config
              gobject-introspection
              wrapGAppsHook4
              desktop-file-utils
              shared-mime-info
              glib
              gtk4
              libadwaita
              gtksourceview5
            ];

            buildInputs = with pkgs; [
              (python3.withPackages (ps: [
                ps.pygobject3
              ]))
              gtk4
              libadwaita
              gtksourceview5
              glib
              libsoup_3
              libsecret
              pkgs.gjs
            ];

            dontWrapGApps = false;

            mesonBuildType = "release";

            postInstall = ''
              # Compile GSettings schemas
              glib-compile-schemas $out/share/glib-2.0/schemas/

              # Update icon cache
              gtk-update-icon-cache $out/share/icons/hicolor/ || true

              # Update desktop database
              update-desktop-database $out/share/applications/ || true
            '';

            postFixup = ''
              # Add gjs to PATH for script_executor.py
              wrapProgram $out/bin/.roster-wrapped \
                --prefix PATH : ${pkgs.gjs}/bin
            '';

            meta = with pkgs.lib; {
              description = shortDesc;
              longDescription = ''
                Roster is a modern HTTP client for testing and debugging REST APIs.
                It provides a clean, GNOME-native interface for making HTTP requests and inspecting responses.
              '';
              homepage = "https://git.bugsy.cz/beval/roster";
              license = licenses.gpl3Plus;
              maintainers = [ ];
              platforms = platforms.linux;
              mainProgram = "roster";
            };
          };
        };

        apps.default = flake-utils.lib.mkApp {
          drv = self.packages.${system}.default;
          name = "roster";
        };
      }
    );
}
