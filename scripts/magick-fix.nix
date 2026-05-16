{ pkgs }:

pkgs.writeShellScriptBin "magick-fix" ''
  set -euo pipefail
  shopt -s nullglob nocaseglob

  FOLDER1="1"
  FOLDER2="2"
  EXTS=(jpg jpeg png webp avif tiff tif bmp gif)
  MAGICK="${pkgs.imagemagick}/bin/magick"

  # Crop bottom 30px from each image in FOLDER2, save as numbered PNGs
  echo "==> Cropping $FOLDER2 ..."
  mkdir -p "$FOLDER2/temp"

  srcs=()
  for ext in "''${EXTS[@]}"; do srcs+=("$FOLDER2"/*."$ext"); done
  [[ ''${#srcs[@]} -eq 0 ]] && { echo "No images in $FOLDER2."; exit 1; }

  i=1
  for src in "''${srcs[@]}"; do
    out=$(printf '%s/temp/%03d.png' "$FOLDER2" $i)
    echo "  $src -> $out"
    "$MAGICK" "$src" -gravity South -crop x30+0+0 +repage "$out"
    (( i++ ))
  done

  # Merge each FOLDER1 image with its numbered overlay
  echo "==> Merging into $FOLDER1/merged ..."
  mkdir -p "$FOLDER1/merged"

  bases=()
  for ext in "''${EXTS[@]}"; do bases+=("$FOLDER1"/*."$ext"); done
  [[ ''${#bases[@]} -eq 0 ]] && { echo "No images in $FOLDER1."; exit 1; }

  i=1
  for base in "''${bases[@]}"; do
    stem=$(basename "''${base%.*}")
    overlay=$(printf '%s/temp/%03d.png' "$FOLDER2" $i)
    out="$FOLDER1/merged/$stem.png"
    if [[ -f "$overlay" ]]; then
      echo "  $base + $overlay -> $out"
      "$MAGICK" "$base" "$overlay" -gravity South -compose Over -composite "$out"
    else
      echo "  $base -> $out (no overlay)"
      "$MAGICK" "$base" "$out"
    fi
    (( i++ ))
  done

  rm -rf "$FOLDER2/temp"
  echo "Done! Merged files are in $FOLDER1/merged/"
''
