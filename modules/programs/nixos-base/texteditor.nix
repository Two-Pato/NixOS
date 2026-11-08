{
  flake.homeModules.nixos-base = { lib, pkgs, ... }: with lib.hm.gvariant; {
    dconf.settings = {
      "org/gnome/TextEditor" = {
        custom-font = "JetBrainsMono Nerd Font 11";
        indent-style = "space";
        restore-session = false;
        tab-width = mkUint32 2;
        use-system-font = false;
      };
    };

    home.packages = with pkgs; [
      gnome-text-editor
    ];

    home.file.".local/share/applications/org.gnome.TextEditor.desktop".text = ''
      [Desktop Entry]
      Name=Texteditor
      Categories=GNOME;Utility;TextEditor;
      Exec=gnome-text-editor --new-window %U
      MimeType=text/plain;
      Comment=View and edit text files
      Icon=org.gnome.TextEditor
      StartupNotify=true
      Terminal=false
      Type=Application
    '';
  };
}
