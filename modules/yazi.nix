{ config, lib, pkgs, ... }:

let
  color = import ../var/color.nix;
in
{
  programs.yazi = {
    enable = true;

    settings = {
      mgr = {
        ratio = [1 4 3];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };

      preview = {
        tab_size = 2;
        max_width = 2000;
        max_height = 3000;
        cache_dir = "";
        image_filter = "lanczos3";
        image_quality = 90;
      };
    };

#    theme = {
#      flavor = {
#        dark = "onimai";
#      };
#    };
  };
#
#  home.file.".config/yazi/flavors/onimai.yazi/flavor.toml".text = ''
#    [colors]
#    background = "#${color.base00-hex}"
#    foreground = "#${color.base06-hex}"
#    selection = "#${color.base01-hex}"
#    cursor = "#${color.base05-hex}"
#    black = "#${color.base11-hex}"
#    red = "#${color.base08-hex}"
#    green = "#${color.base0B-hex}"
#    yellow = "#${color.base0A-hex}"
#    blue = "#${color.base0D-hex}"
#    magenta = "#${color.base0E-hex}"
#    cyan = "#${color.base0C-hex}"
#    white = "#${color.base06-hex}"
#    bright_black = "#${color.base03-hex}"
#    bright_red = "#${color.base08-hex}"
#    bright_green = "#${color.base0B-hex}"
#    bright_yellow = "#${color.base13-hex}"
#    bright_blue = "#${color.base0D-hex}"
#    bright_magenta = "#${color.base0E-hex}"
#    bright_cyan = "#${color.base0C-hex}"
#    bright_white = "#${color.base07-hex}"
#
#    [manager]
#    cwd = { fg = "cyan" }
#    # Hovered
#    hovered         = { fg = "#${color.base06-hex}", bg = "#${color.base01-hex}" }
#    preview_hovered = { underline = true }
#    # Find
#    find_keyword  = { fg = "#${color.base13-hex}", bold = true, italic = true, underline = true }
#    find_position = { fg = "#${color.base0C-hex}", bg = "#${color.base00-hex}", bold = true, italic = true }
#    # Marker
#    marker_copied   = { fg = "#73C991", bg = "#73C991" }
#    marker_cut      = { fg = "#${color.base0D-hex}", bg = "#${color.base0D-hex}" }
#    marker_marked   = { fg = "#${color.base0E-hex}", bg = "#${color.base0E-hex}" }
#    marker_selected = { fg = "#${color.base0A-hex}", bg = "#${color.base0A-hex}" }
#    # Tab
#    tab_active   = { fg = "#${color.base06-hex}", bg = "#${color.base00-hex}" }
#    tab_inactive = { fg = "#${color.base06-hex}", bg = "#2D2D2D" }
#    tab_width    = 1
#    # Count
#    count_copied   = { fg = "#${color.base00-hex}", bg = "#73C991" }
#    count_cut      = { fg = "#${color.base00-hex}", bg = "#${color.base0D-hex}" }
#    count_selected = { fg = "#${color.base00-hex}", bg = "#${color.base0A-hex}" }
#    # Border
#    border_symbol = "│"
#    border_style  = { fg = "#444444" }
#    # Highlighting
#    syntect_theme = "./tmtheme.xml"
#    # Cursor
#    cursor_symbol = "█"
#    cursor = { fg = "#${color.base00-hex}", bg = "#${color.base05-hex}" }
#    # Executable
#    exe_symbol = ""
#    exe = { fg = "#${color.base0E-hex}", bg = "#${color.base00-hex}" }
#    # Regular
#    file_symbol = ""
#    file = { }
#    # Directory
#    folder_symbol = ""
#    folder = { fg = "#${color.base08-hex}", bg = "#${color.base00-hex}" }
#    # Hidden
#    hidden_symbol = ""
#    hidden = { fg = "#${color.base03-hex}" }
#    # Link
#    link_symbol = ""
#    link = { fg = "#${color.base0E-hex}", bg = "#${color.base00-hex}" }
#    # Link (broken)
#    broken_symbol = ""
#    broken = { fg = "#${color.base0D-hex}", bg = "#3A1212" }
#    # Selected
#    selected = { fg = "#${color.base07-hex}", bg = "#${color.base01-hex}" }
#
#    [status]
#    separator_open  = ""
#    separator_close = ""
#    separator_style = { fg = "#444444", bg = "#444444" }
#    # Mode
#    mode_normal = { fg = "#${color.base00-hex}", bg = "#${color.base08-hex}", bold = true }
#    mode_select = { fg = "#${color.base00-hex}", bg = "#FFAF00", bold = true }
#    mode_unset  = { fg = "#${color.base00-hex}", bg = "#${color.base0D-hex}", bold = true }
#    # Progress
#    progress_label  = { bold = true }
#    progress_normal = { fg = "#${color.base08-hex}", bg = "#${color.base00-hex}" }
#    progress_error  = { fg = "#${color.base0D-hex}", bg = "#${color.base00-hex}" }
#    # Permissions
#    permissions_t = { fg = "#${color.base0B-hex}" }
#    permissions_r = { fg = "#${color.base0A-hex}" }
#    permissions_w = { fg = "#${color.base0D-hex}" }
#    permissions_x = { fg = "#${color.base0E-hex}" }
#    permissions_s = { fg = "#${color.base03-hex}" }
#
#    [select]
#    border   = { fg = "#${color.base08-hex}" }
#    active   = { fg = "#${color.base0C-hex}", bold = true }
#    inactive = {}
#
#    [input]
#    border   = { fg = "#${color.base08-hex}" }
#    title    = {}
#    value    = {}
#    selected = { reversed = true }
#
#    [completion]
#    border   = { fg = "#${color.base08-hex}" }
#    active   = { bg = "#${color.base01-hex}" }
#    inactive = {}
#    # Icons
#    icon_file    = ""
#    icon_folder  = ""
#    icon_command = ""
#
#    [tasks]
#    border  = { fg = "#${color.base08-hex}" }
#    title   = {}
#    hovered = { underline = true }
#
#    [which]
#    mask            = { bg = "#${color.base00-hex}" }
#    cand            = { fg = "#${color.base0E-hex}" }
#    rest            = { fg = "#${color.base03-hex}" }
#    desc            = { fg = "#${color.base0C-hex}" }
#    separator       = "  "
#    separator_style = { fg = "#${color.base03-hex}" }
#
#    [help]
#    on      = { fg = "#${color.base0E-hex}" }
#    run     = { fg = "#${color.base0C-hex}" }
#    desc    = { fg = "#${color.base06-hex}" }
#    hovered = { bg = "#${color.base01-hex}", bold = true }
#    footer  = { fg = "#${color.base06-hex}", bg = "#252526" }
#
#    [filetype]
#    rules = [
#        # Images
#        { mime = "image/*", fg = "#${color.base0A-hex}" },
#        # Videos
#        { mime = "video/*", fg = "#${color.base0C-hex}" },
#        # Audio
#        { mime = "audio/*", fg = "#${color.base0C-hex}" },
#        # Archives
#        { mime = "application/zip", fg = "#${color.base0D-hex}" },
#        { mime = "application/gzip", fg = "#${color.base0D-hex}" },
#        { mime = "application/x-tar", fg = "#${color.base0D-hex}" },
#        { mime = "application/x-bzip", fg = "#${color.base0D-hex}" },
#        { mime = "application/x-bzip2", fg = "#${color.base0D-hex}" },
#        { mime = "application/x-7z-compressed", fg = "#${color.base0D-hex}" },
#        { mime = "application/x-rar", fg = "#${color.base0D-hex}" },
#        # Documents
#        { mime = "application/pdf", fg = "#${color.base0E-hex}" },
#        { mime = "application/msword", fg = "#${color.base0E-hex}" },
#        { mime = "application/vnd.openxmlformats-officedocument.*", fg = "#${color.base0E-hex}" },
#        # Fallback
#        { name = "*", fg = "#${color.base06-hex}" },
#        { name = "*/", fg = "#${color.base08-hex}" },
#        # Executable
#        { name = "*", category = "executable", fg = "#${color.base0E-hex}", bg = "#${color.base00-hex}" },
#        # Directories
#        { name = "*/", fg = "#${color.base08-hex}", bg = "#${color.base00-hex}" },
#        # Hidden files
#        { name = ".*", fg = "#${color.base03-hex}" },
#        # Symlinks
#        { name = "*", category = "link", fg = "#${color.base0E-hex}", bg = "#${color.base00-hex}" },
#        # Broken symlinks
#        { name = "*", category = "broken", fg = "#${color.base0D-hex}", bg = "#3A1212" },
#    ]
#
#    [icon]
#    rules = [
#        { name = "Desktop", text = "" },
#        { name = "Documents", text = "" },
#        { name = "Downloads", text = "" },
#        { name = "Pictures", text = "" },
#        { name = "Music", text = "" },
#        { name = "Videos", text = "" },
#        { name = ".git", text = "" },
#        { name = ".config", text = "" },
#    ]
#  '';
}
