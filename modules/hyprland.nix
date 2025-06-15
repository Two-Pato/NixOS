{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;

    settings = {
      # Monitor
      monitor = [ ",preferred,auto,auto" ];

      # Autostart
      exec-once = [
        "uwsm app -- waybar"

        "[workspace 1 silent] uwsm app -- firefox"
        "[workspace 2 silent] uwsm app -- nautilus"
      ];

      # General Window Decoration
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          xray = true;
        };

        shadow = {
          enabled = false;
          range = 30;
          render_power = 3;
        };
      };

      # Animations
      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, once"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      # Layout Settings
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
        resize_on_border = true;
        allow_tearing = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      gestures = {
        workspace_swipe = false;
      };

      binds = {
        workspace_back_and_forth = true;
        allow_workspace_cycles = true;
        pass_mouse_when_bound = false;
      };

      # Keyboard Layout
      input = {
        kb_layout = "de";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = false;
      };
      
      cursor.no_warps = true;

      # Keybindings
      "$mainMod" = "SUPER";

      bind = [
        # Important
        "$mainMod CTRL, ESCAPE, exit"
        "$mainMod, R, exec, pkill waybar || waybar"

        # Applications
        "$mainMod, RETURN, exec, uwsm app -- kitty"
        "$mainMod, B, exec, uwsm app -- firefox"
        "$mainMod ALT, B, exec, uwsm app -- firefox --private-window"
        "$mainMod, E, exec, uwsm app -- nautilus -w"
        "$mainMod SHIFT, E, exec, uwsm app -- kitty --class yazi -e yazi"
        "$mainMod, SPACE, exec, pkill -x rofi || rofi -show drun -replace -i -run-command \"uwsm app -- {cmd}\""
        "$mainMod, V, exec, pkill -x clipse || kitty --class clipse -e clipse"
        "$mainMod, N, exec, pkill -x nano || kitty -d ~/Documents --class nano -e nano"
        "$mainMod, S, exec, pkill -x fzf || kitty --class fzf -e fzf --preview \'cat {}\' --bind \'enter:become(nano {+})\'"

        # Windows
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, T, togglefloating"
        "$mainMod, Y, togglesplit"
        "$mainMod, X, swapsplit"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod SHIFT, right, resizeactive, 100 0"
        "$mainMod SHIFT, left, resizeactive, -100 0"
        "$mainMod SHIFT, down, resizeactive, 0 100"
        "$mainMod SHIFT, up, resizeactive, 0 -100"
        "$mainMod, G, togglegroup"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, Tab, workspace, m+1"
        "$mainMod SHIFT, Tab, workspace, m-1"
        "$mainMod CTRL, Tab, workspace, empty"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindel = [
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ];

      # Window Rules
      windowrulev2 = [
        # General
        "suppressevent maximize, class:.*" # Ignore maximize requests from apps. You'll probably like this.
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" # Fix some dragging issues with XWayland
        # Clipse
        "float,class:(clipse)"
        "size 622 652,class:(clipse)"
        # Nano
        "float,class:(nano)"
        # Fzf
        "float,class:(fzf)"
        "size 75% 75%,class:(fzf)"
      ];
    };
  };
}
