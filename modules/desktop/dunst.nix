{ config, lib, pkgs, ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        monitor = 0;
        follow = "none";
        origin = "top-right";
        offset = "(15, 15)";
        alignment = "left";
        vertical_alignment = "center";

        width = 300;
        height = "(0, 145)";
        corner_radius = 15;
        gap_size = 8;
        line_height = 0;

        font = lib.mkForce "JetBrainsMono Nerd Font 10";
        format = "<b>%s</b>\\n%b";
        word_wrap = "yes";
        markup = "full";
        transparency = 0;
        separator_height = 2;
        frame_width = 2;
        ellipsize = "middle";

        padding = 15;
        horizontal_padding = 15;
        text_icon_padding = 15;

        icon_position = "left";
        min_icon_size = 48;
        max_icon_size = 64;

        progress_bar = true;
        progress_bar_height = 8;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;

        notification_limit = 0;
        history_length = 20;
        idle_threshold = 120;
        show_age_threshold = 60;
        show_indicators = "no";
        sort = "yes";
        shrink = "no";
        indicate_hidden = "yes";
        sticky_history = "yes";
        ignore_newline = "no";
        stack_duplicates = true;
        always_run_script = true;
        hide_duplicate_count = false;
        ignore_dbusclose = false;

        force_xwayland = false;
        force_xinerama = false;

        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };

      experimental.per_monitor_dpi = false;

      urgency_low.timeout = 4;
      urgency_normal.timeout = 6;
      urgency_critical.timeout = 0;
    };
  };
}
