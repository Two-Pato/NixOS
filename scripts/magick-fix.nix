{ pkgs }:

pkgs.writeShellScriptBin "magick-fix" ''
  set -euo pipefail

  FOLDER1="1"
  FOLDER2="2"

  # Step 1: Crop bottom 30px from all images in folder 2
  echo "==> Processing images in $FOLDER2 ..."
  cd "$FOLDER2"
  mkdir -p temp

  mapfile -t sources < <(find . -maxdepth 1 \( -iname "*.jpg" -o -iname "*.webp" -o -iname "*.avif" \) | sort)

  if [ ''${#sources[@]} -eq 0 ]; then
    echo "No .jpg/.webp/.avif files found in $FOLDER2. Exiting."
    exit 1
  fi

  for src in "''${sources[@]}"; do
    src="''${src#./}"
    echo "  Cropping: $src"
    ${pkgs.imagemagick}/bin/magick "$src" -gravity South -crop x30+0+0 +repage "temp/''${src%.*}_cropped.png"
  done

  # Step 2: Rename cropped PNGs to 001.png, 002.png, ...
  echo "==> Renaming cropped PNGs ..."

  mapfile -t cropped < <(find temp -maxdepth 1 -iname "*_cropped.png" | sort)

  counter=1
  for f in "''${cropped[@]}"; do
    newname=$(printf "%03d.png" "$counter")
    mv "$f" "temp/$newname"
    echo "  $f  ->  $newname"
    (( counter++ ))
  done

  # Step 3: Copy renamed PNGs to folder 1
  cd - > /dev/null
  echo "==> Copying PNGs to $FOLDER1 ..."
  mkdir -p "$FOLDER1/temp"
  cp "$FOLDER2"/temp/*.png "$FOLDER1/temp/"
  rm -rf "$FOLDER2/temp"

  # Step 4: Merge JPGs with matching PNGs in folder 1
  echo "==> Merging in $FOLDER1 ..."
  cd "$FOLDER1"
  mkdir -p merged

  for f in *.jpg; do
    base="''${f%.jpg}"
    if [ -f "temp/$base.png" ]; then
      echo "  Merging: $f + temp/$base.png -> merged/$base.png"
      ${pkgs.imagemagick}/bin/magick "$f" "temp/$base.png" -gravity south -compose over -composite "merged/$base.png"
    else
      echo "  Skipping $base.png (not found)"
    fi
  done

  rm -rf temp
  echo ""
  echo "Done! Merged files are in $FOLDER1/merged/"
''
