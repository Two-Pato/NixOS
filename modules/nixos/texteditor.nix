{ config, lib, pkgs, ... }:

with lib.hm.gvariant;

{
  home.packages = with pkgs; [
    gnome-text-editor
  ];

  dconf.settings = {
    "org/gnome/TextEditor" = {
      custom-font = "JetBrainsMono Nerd Font 11";
      restore-session = false;
      right-margin-position = mkUint32 80;
      use-system-font = false;
    };
  };

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
}
