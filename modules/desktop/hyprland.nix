{ config, lib, pkgs, hostName, ... }:

let
  workspace1_mihari = "[ workspace 1 silent ] uwsm app -- firefox";
  workspace2_mihari = "[ workspace 2 silent ] uwsm app -- nautilus";
  workspace1_mahiro = "[ workspace 1 silent ] uwsm app -- steam";
  workspace2_mahiro = "[ workspace 2 silent ] uwsm app -- bottles";

  workspace1_host =
    if hostName == "mihari" then workspace1_mihari
    else if hostName == "mahiro" then workspace1_mahiro
    else null;
  
  workspace2_host =
    if hostName == "mihari" then workspace2_mihari
    else if hostName == "mahiro" then workspace2_mahiro
    else null;
in
{
  wayland.windowManager.hyprland = lib.mkIf (workspace1_host != null || workspace2_host != null) {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;

    settings = {
      # Monitor
      monitor = [ ",preferred,auto,auto" ];
      xwayland.force_zero_scaling = true;

      # Autostart
      exec-once = [
        "uwsm app -- waybar"

        workspace1_host
        workspace2_host
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
        "$mainMod, R, exec, pkill -SIGUSR1 waybar"

        # Applications
        "$mainMod, RETURN, exec, uwsm app -- kitty"
        "$mainMod, B, exec, uwsm app -- firefox"
        "$mainMod ALT, B, exec, uwsm app -- firefox --private-window"
        "$mainMod, E, exec, uwsm app -- nautilus -w"
        "$mainMod SHIFT, E, exec, uwsm app -- kitty --class yazi -e yazi"
        "$mainMod, SPACE, exec, pkill -x rofi || uwsm app -- rofi -show drun -replace -i -run-command \"uwsm app -- {cmd}\""
        "$mainMod, V, exec, pkill -x clipse || uwsm app -- kitty --class clipse -e clipse"
        "$mainMod, N, exec, pkill -x nvim || uwsm app -- kitty -d ~/Documents --class nvim -e nvim"
        "$mainMod, S, exec, pkill -x tv || uwsm app -- kitty --class tv -e tv text"

        # Special Keys
        ", print, exec, grim $(xdg-user-dir PICTURES)/$(date +'%s_screenshot.png')"
        "SHIFT, print, exec, grim -g \"$(slurp)\" $(xdg-user-dir PICTURES)/$(date +'%s_screenshot.png')"

        "$mainMod, L, exec, uwsm app -- hyprlock"

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

        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        "$mainMod CTRL, right, resizeactive, 100 0"
        "$mainMod CTRL, left, resizeactive, -100 0"
        "$mainMod CTRL, down, resizeactive, 0 100"
        "$mainMod CTRL, up, resizeactive, 0 -100"

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
      windowrule = [
        # General
        "suppress_event maximize, match:class .*"
        "no_focus on, match:class ^$, match:title ^$, match:float true, match:fullscreen false, match:pin false, match:xwayland true"

        # Clipse
        "float on, match:class clipse"
        "center on, match:class clipse"
        "size 622 652, match:class clipse"
        "stay_focused on, match:class clipse"

        # Nvim
        "float on, match:class nvim"
        "center on, match:class nvim"
        "size monitor_w*0.75 monitor_h*0.75, match:class nvim"

        # Picture in Picture
        "float on, match:title Picture-in-Picture"
        "pin on, match:title Picture-in-Picture"
        "size monitor_w*0.25 monitor_h*0.25, match:title Picture-in-Picture"
        "move monitor_w*0.75-25 monitor_h*0.75-25, match:title Picture-in-Picture"

        # Sushi
        "float on, match:class org.gnome.NautilusPreviewer"
        "center on, match:class org.gnome.NautilusPreviewer"
        "size monitor_w*0.35 monitor_h*0.75, match:class org.gnome.NautilusPreviewer"

        # Tv
        "float on, match:class tv"
        "center on, match:class tv"
        "size monitor_w*0.75 monitor_h*0.75, match:class tv"
      ];

      # Miscellaneous
      misc = {
        enable_anr_dialog = false;
      };
    };
  };

  home.packages = with pkgs; [
    grim
    slurp
  ];
}
