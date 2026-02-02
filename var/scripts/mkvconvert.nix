{ pkgs }:

pkgs.writeShellScriptBin "mkv-convert" ''
  mkdir -p mux

  find . -type f -name '*.mkv' | while read -r filename; do
    # Count audio tracks
    audio_count="$(${pkgs.mkvtoolnix}/bin/mkvmerge -i "$filename" \
      | grep 'Track ID' \
      | grep 'audio' \
      | wc -l)"

    # Count subtitle tracks
    subtitle_count="$(${pkgs.mkvtoolnix}/bin/mkvmerge -i "$filename" \
      | grep 'Track ID' \
      | grep 'subtitles' \
      | wc -l)"

    if [ "$subtitle_count" -eq 0 ]; then
      # No subtitles at all
      ${pkgs.mkvtoolnix}/bin/mkvmerge \
        --output "mux/$filename" \
        --language 0:ja \
        --track-name '0:Video' \
        --default-track 0:yes \
        --language 1:ja \
        --track-name '1:Japanese' \
        --default-track 1:yes \
        --language 2:en \
        --track-name '2:English' \
        --default-track 2:yes \
        '(' "$filename" ')' \
        --track-order 0:0,0:1,0:2

    elif [ "$audio_count" -ge 2 ]; then
      # Two soundtracks + English
      ${pkgs.mkvtoolnix}/bin/mkvmerge \
        --output "mux/$filename" \
        --language 0:ja \
        --track-name '0:Video' \
        --default-track 0:yes \
        --language 1:ja \
        --track-name '1:Japanese' \
        --default-track 1:yes \
        --language 2:ja \
        --track-name '2:Japanese Surround' \
        --default-track 2:no \
        --language 3:en \
        --track-name '3:English' \
        --default-track 3:yes \
        '(' "$filename" ')' \
        --track-order 0:0,0:1,0:2,0:3

    else
      # Single Japanese + English
      ${pkgs.mkvtoolnix}/bin/mkvmerge \
        --output "mux/$filename" \
        --language 0:ja \
        --track-name '0:Video' \
        --default-track 0:yes \
        --language 1:ja \
        --track-name '1:Japanese' \
        --default-track 1:yes \
        --language 2:en \
        --track-name '2:English' \
        --default-track 2:yes \
        '(' "$filename" ')' \
        --track-order 0:0,0:1,0:2
    fi
  done
''
