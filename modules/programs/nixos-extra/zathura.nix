{ config, ... }:
{
  flake.homeModules.nixos-extra = { lib, pkgs, ... }: {
    programs.zathura = {
      enable = true;

      extraConfig = ''
        map <Left> navigate previous
        map <Right> navigate next
      '';

      options = {
        default-bg = lib.mkForce "rgba(${config.colors.base00-rgba})";
        font = "JetBrainsMono Nerd Font 14";
        selection-clipboard = "clipboard";
        statusbar-basename = true;
      };

      package = pkgs.zathura.override {
        plugins = with pkgs.zathuraPkgs; [
          zathura_cb
          zathura_pdf_mupdf
        ];
      };
    };
  };
}
