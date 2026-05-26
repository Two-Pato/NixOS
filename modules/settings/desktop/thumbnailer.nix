{
  flake.nixosModules.desktop-settings = { config, lib, pkgs, ... }:
  let
    gdk-pixbuf-loaders = pkgs.gdk-pixbuf.override {
      extraLoaders = [ pkgs.librsvg ];
    };
  in {
    environment.variables = {
      GDK_PIXBUF_MODULE_FILE = "${gdk-pixbuf-loaders}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache";
    };
    environment.sessionVariables = {
      GDK_PIXBUF_MODULE_FILE = "${gdk-pixbuf-loaders}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache";
    };
    environment.pathsToLink = [
      "share/thumbnailers"
    ];
    environment.systemPackages = with pkgs; [
      gdk-pixbuf
    ];
  };
}