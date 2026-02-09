{ pkgs }:

pkgs.writeShellScriptBin "magick-cut" ''
  magick *.jpg -gravity South -crop x20+0+0 +repage *.png
''
