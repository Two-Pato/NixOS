{ config, lib, pkgs, ... }:

{
  programs.zathura = {
    enable = true;

    package = pkgs.zathura.override {
      plugins = with pkgs.zathuraPkgs; [
        zathura_pdf_mupdf
        zathura_cb
      ];
    };

    options = {
      font = "JetBrainsMono Nerd Font 14";
    };
  };
}
