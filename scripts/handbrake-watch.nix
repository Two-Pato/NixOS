{ pkgs }:

pkgs.writeShellScriptBin "handbrake-watch" ''
  wait_stable() {
    local last=-1 now
    while true; do
      now=$(stat -c %s "$1")
      if [ "$now" = "$last" ] && [ $(( $(date +%s) - $(stat -c %Y "$1") )) -gt 30 ]; then
        return 0
      fi
      last=$now
      sleep 30
    done
  }

  cleanup_dirs() {
    local d
    d=$(dirname "$IN_DIR/$1")
    while [ "$d" != "$IN_DIR" ] && [ "$d" != "/" ]; do
      rmdir "$d" 2>/dev/null || break
      d=$(dirname "$d")
    done
  }

  encoded=()
  failed=()

  while IFS= read -r -d "" f; do
    [ -e "$f" ] || continue
    wait_stable "$f"

    rel="''${f#"$IN_DIR"/}"
    reldir=$(dirname "$rel")
    name=$(basename "$rel")
    base="''${name%.*}"

    mkdir -p "$OUT_DIR/$reldir"
    target="$OUT_DIR/$reldir/$base.$OUT_EXT"
    tmp="$OUT_DIR/$reldir/$base.partial.$OUT_EXT"

    if HandBrakeCLI \
         --preset-import-file "$PRESET_FILE" \
         --preset "$PRESET_NAME" \
         -i "$f" -o "$tmp" </dev/null; then
      mv "$tmp" "$target"
      encoded+=("$rel")
    else
      rm -f "$tmp"
      mkdir -p "$FAILED_DIR/$reldir"
      mv "$f" "$FAILED_DIR/$reldir/"
      failed+=("$rel")
    fi
  done < <(find "$IN_DIR" -type f -print0 | sort -z)

  for rel in "''${encoded[@]}"; do
    mkdir -p "$DONE_DIR/$(dirname "$rel")"
    mv "$IN_DIR/$rel" "$DONE_DIR/$rel"
  done

  for rel in "''${encoded[@]}" "''${failed[@]}"; do
    cleanup_dirs "$rel"
  done
''
