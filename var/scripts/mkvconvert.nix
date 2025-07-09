{ pkgs }:

pkgs.writeShellScriptBin "mkvconvert" ''
  find . -type f -name '*.mkv' | {
    while read filename ; do
      ${pkgs.mkvtoolnix}/bin/mkvmerge \
        --output "mux/''${filename}" \
        --language 0:ja \
        --track-name '0:Video' \
        --default-track 0:yes \
        --language 1:ja \
        --track-name '1:Japanese' \
        --default-track 1:yes \
        --language 2:en \
        --track-name '2:English' \
        --default-track 2:yes \
        '(' "''${filename}" ')' \
        --track-order 0:0,0:1,0:2
    done
  }
''
