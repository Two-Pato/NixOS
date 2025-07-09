{ pkgs }:

pkgs.writeShellScriptBin "mkvconvert"''
  # Create output directory
  mkdir -p mux

  # Path to mkvmerge
  MKVMERGE="${pkgs.mkvtoolnix}bin/mkvmerge"

  # Process all MKV files in current directory (recursively)
  find . -type f -name '*.mkv' | while read -r filename; do
    # Strip leading ./ if present and get just the filename
    basefile=$(basename "$filename")
    output="mux/${basefile}"

    echo "Processing: $filename"

    "$MKVMERGE" --output "$output" \
      --language 0:ja --default-track 0:yes --track-name "Video"\
      --language 1:ja --default-track 1:yes --track-name "Japanese" \
      --language 2:en --default-track 2:yes --track-name "English" \
      "(" "$filename" ")" \
      --track-order 0:0,0:1,0:2

    echo "Done: $output"
  done
''