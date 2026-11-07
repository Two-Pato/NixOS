{
  flake.homeModules.nixos-desktop = { lib, ... }: {
    services.dunst = {
      enable = true;

      settings = {
        experimental.per_monitor_dpi = false;

        global = {
          # Position and size
          follow = "none";
          gap_size = 8;
          height = "(0, 145)";
          horizontal_padding = 15;
          layer = "top";
          monitor = 0;
          offset = "(15, 15)";
          origin = "top-right";
          padding = 15;
          separator_height = 2;
          text_icon_padding = 15;
          width = 300;

          # Frame
          corner_radius = 15;
          frame_width = 2;

          # Text
          alignment = "left";
          ellipsize = "middle";
          font = lib.mkForce "JetBrainsMono Nerd Font 10";
          format = "<b>%s</b>\\n%b";
          line_height = 0;
          markup = "full";
          vertical_alignment = "center";
          word_wrap = "yes";

          # Icons
          icon_position = "left";
          max_icon_size = 64;
          min_icon_size = 48;

          # Progress bar
          progress_bar = true;
          progress_bar_frame_width = 1;
          progress_bar_height = 8;
          progress_bar_max_width = 300;
          progress_bar_min_width = 150;

          # History
          history_length = 20;
          show_age_threshold = 60;
          sticky_history = "yes";

          # Behavior
          hide_duplicate_count = false;
          ignore_dbusclose = false;
          ignore_newline = "no";
          indicate_hidden = "yes";
          notification_limit = 0;
          show_indicators = "no";
          sort = "yes";
          stack_duplicates = true;

          # Mouse
          mouse_left_click = "do_action";
          mouse_middle_click = "close_all";
          mouse_right_click = "close_current";

          # Compatibility
          force_xinerama = false;
          force_xwayland = false;
        };

        urgency_critical.timeout = 0;
        urgency_low.timeout = 4;
        urgency_normal.timeout = 6;
      };
    };
  };
}
