{
  flake.homeModules.nixos-desktop = { lib, ... }: {
    services.dunst = {
      enable = true;

      settings = {
        global = {
          monitor = 0;
          follow = "none";
          origin = "top-right";
          offset = "(15, 15)";
          layer = "top";

          width = 300;
          height = "(0, 145)";
          gap_size = 8;
          padding = 15;
          horizontal_padding = 15;
          text_icon_padding = 15;
          separator_height = 2;

          corner_radius = 15;
          frame_width = 2;

          font = lib.mkForce "JetBrainsMono Nerd Font 10";
          alignment = "left";
          vertical_alignment = "center";
          line_height = 0;
          format = "<b>%s</b>\\n%b";
          word_wrap = "yes";
          markup = "full";
          ellipsize = "middle";

          icon_position = "left";
          min_icon_size = 48;
          max_icon_size = 64;

          progress_bar = true;
          progress_bar_height = 8;
          progress_bar_frame_width = 1;
          progress_bar_min_width = 150;
          progress_bar_max_width = 300;

          history_length = 20;
          sticky_history = "yes";
          show_age_threshold = 60;

          notification_limit = 0;
          sort = "yes";
          stack_duplicates = true;
          hide_duplicate_count = false;
          indicate_hidden = "yes";
          show_indicators = "no";
          ignore_newline = "no";
          ignore_dbusclose = false;

          mouse_left_click = "do_action";
          mouse_middle_click = "close_all";
          mouse_right_click = "close_current";

          force_xwayland = false;
          force_xinerama = false;
        };

        experimental.per_monitor_dpi = false;

        urgency_low.timeout = 4;
        urgency_normal.timeout = 6;
        urgency_critical.timeout = 0;
      };
    };
  };
}
