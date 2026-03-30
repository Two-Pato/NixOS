{ pkgs }:

pkgs.writeShellScriptBin "magick-merge" ''
  mkdir -p merged

  for f in *.jpg; do
    base="''${f%.jpg}"
    if [ -f "$base.png" ]; then
      magick "$f" "$base.png" -gravity south -compose over -composite "merged/$base.png"
    else
      echo "Skipping $base.png (not found)"
    fi
  done
''
