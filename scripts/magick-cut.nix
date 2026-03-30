{ pkgs }:

pkgs.writeShellScriptBin "magick-cut" ''
  magick *.jpg -gravity South -crop x30+0+0 +repage *.png
''
