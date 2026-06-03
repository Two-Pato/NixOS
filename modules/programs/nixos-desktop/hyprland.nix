{
  flake.nixosModules.desktop-settings = {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };
  };

  flake.homeModules.nixos-desktop = { lib, pkgs, osConfig, ... }: {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;

      package = null;
      portalPackage = null;

      configType = "lua";

      settings = {
        # Monitor
        monitor = [{
          output = "";
          mode = "preferred";
          position = "auto";
          scale = "auto";
        }];

        # Autostart
        on = {
          _args = [
            "hyprland.start"
            (lib.generators.mkLuaInline ''
              function()
                hl.exec_cmd("uwsm app -- waybar")
                ${lib.optionalString (osConfig.networking.hostName == "mihari") ''
                  hl.exec_cmd("[ workspace 1 silent ] uwsm app -- firefox")
                  hl.exec_cmd("[ workspace 2 silent ] uwsm app -- nautilus")
                ''}
                ${lib.optionalString (osConfig.networking.hostName == "mahiro") ''
                  hl.exec_cmd("[ workspace 1 silent ] uwsm app -- steam")
                  hl.exec_cmd("[ workspace 2 silent ] uwsm app -- faugus-launcher")
                ''}
              end
            '')
          ];
        };

        config = {
          # Keyboard Layout
          input = {
            kb_layout = "de";
            numlock_by_default = true;
            follow_mouse = 1;
            sensitivity = 0;
            touchpad.natural_scroll = false;
          };

          cursor.no_warps = true;

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
            preserve_split = true;
          };

          binds = {
            workspace_back_and_forth = true;
            allow_workspace_cycles = true;
            pass_mouse_when_bound = false;
          };

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
              ignore_opacity = true;
              xray = true;
            };

            shadow = {
              enabled = false;
            };
          };

          # Miscellaneous
          xwayland.force_zero_scaling = true;

          misc = {
            enable_anr_dialog = false;
          };
        };

        # Animations
        curve = [
          { _args = [ "wind" (lib.generators.mkLuaInline ''{ type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } }'') ]; }
          { _args = [ "winIn" (lib.generators.mkLuaInline ''{ type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } }'') ]; }
          { _args = [ "winOut" (lib.generators.mkLuaInline ''{ type = "bezier", points = { { 0.3, -0.3 }, { 0, 1 } } }'') ]; }
          { _args = [ "liner" (lib.generators.mkLuaInline ''{ type = "bezier", points = { { 1, 1 }, { 1, 1 } } }'') ]; }
        ];

         animation = [
           { leaf = "windows"; enabled = true; speed = 6; bezier = "wind"; style = "slide"; }
           { leaf = "windowsIn"; enabled = true; speed = 6; bezier = "winIn"; style = "slide"; }
           { leaf = "windowsOut"; enabled = true; speed = 5; bezier = "winOut"; style = "slide"; }
           { leaf = "windowsMove"; enabled = true; speed = 5; bezier = "wind"; style = "slide"; }
           { leaf = "border"; enabled = true; speed = 1; bezier = "liner"; }
           { leaf = "borderangle"; enabled = true; speed = 30; bezier = "liner"; style = "once"; }
           { leaf = "fade"; enabled = true; speed = 10; bezier = "default"; }
           { leaf = "workspaces"; enabled = true; speed = 5; bezier = "wind"; }
         ];

        # Keybindings
        mod._var = "SUPER";

        bind = [
          # Session
          { _args = [ "SUPER + CTRL + Escape" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("uwsm stop")'') ]; }
          { _args = [ "SUPER + R" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("pkill -SIGUSR1 waybar")'') ]; }

          # Applications
          { _args = [ "SUPER + Return" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("uwsm app -- kitty")'') ]; }
          { _args = [ "SUPER + B" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("uwsm app -- firefox")'') ]; }
          { _args = [ "SUPER + ALT + B" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("uwsm app -- firefox --private-window")'') ]; }
          { _args = [ "SUPER + E" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("uwsm app -- nautilus -w")'') ]; }
          { _args = [ "SUPER + SHIFT + E" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("uwsm app -- kitty --class yazi -e yazi")'') ]; }
          { _args = [ "SUPER + Space" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("pkill -x rofi || uwsm app -- rofi -show drun -replace -i -run-command \"uwsm app -- {cmd}\"")'') ]; }
          { _args = [ "SUPER + V" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("pkill -x clipse || uwsm app -- kitty --class clipse -e clipse")'') ]; }
          { _args = [ "SUPER + N" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("pkill -x nvim || uwsm app -- kitty -d ~/Documents --class nvim -e nvim")'') ]; }
          { _args = [ "SUPER + S" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("pkill -x tv || uwsm app -- kitty --class tv -e tv text")'') ]; }

          # Special Keys
          { _args = [ "Print" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("grim $(xdg-user-dir PICTURES)/$(date +'%s_screenshot.png')")'') ]; }
          { _args = [ "SHIFT + Print" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("grim -g \"$(slurp)\" $(xdg-user-dir PICTURES)/$(date +'%s_screenshot.png')")'') ]; }
          { _args = [ "SUPER + L" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("uwsm app -- hyprlock")'') ]; }

          # Window Management
          { _args = [ "SUPER + Q" (lib.generators.mkLuaInline ''hl.dsp.window.close()'') ]; }
          { _args = [ "SUPER + F" (lib.generators.mkLuaInline ''hl.dsp.window.fullscreen()'') ]; }
          { _args = [ "SUPER + T" (lib.generators.mkLuaInline ''hl.dsp.window.float({ action = "toggle" })'') ]; }
          { _args = [ "SUPER + Y" (lib.generators.mkLuaInline ''hl.dsp.layout("togglesplit")'') ]; }
          { _args = [ "SUPER + X" (lib.generators.mkLuaInline ''hl.dsp.layout("swapsplit")'') ]; }

          # Window Focus
          { _args = [ "SUPER + left" (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "l" })'') ]; }
          { _args = [ "SUPER + right" (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "r" })'') ]; }
          { _args = [ "SUPER + up" (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "u" })'') ]; }
          { _args = [ "SUPER + down" (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "d" })'') ]; }

          # Window Move
          { _args = [ "SUPER + SHIFT + left" (lib.generators.mkLuaInline ''hl.dsp.window.move({ direction = "l" })'') ]; }
          { _args = [ "SUPER + SHIFT + right" (lib.generators.mkLuaInline ''hl.dsp.window.move({ direction = "r" })'') ]; }
          { _args = [ "SUPER + SHIFT + up" (lib.generators.mkLuaInline ''hl.dsp.window.move({ direction = "u" })'') ]; }
          { _args = [ "SUPER + SHIFT + down" (lib.generators.mkLuaInline ''hl.dsp.window.move({ direction = "d" })'') ]; }

          # Workspace Cycling
          { _args = [ "SUPER + Tab" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "m+1" })'') ]; }
          { _args = [ "SUPER + SHIFT + Tab" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "m-1" })'') ]; }
          { _args = [ "SUPER + CTRL + Tab" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "empty" })'') ]; }
          { _args = [ "SUPER + mouse_down" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "e+1" })'') ]; }
          { _args = [ "SUPER + mouse_up" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "e-1" })'') ]; }

          # Workspaces Switch
          { _args = [ "SUPER + 1" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 1 })'') ]; }
          { _args = [ "SUPER + 2" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 2 })'') ]; }
          { _args = [ "SUPER + 3" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 3 })'') ]; }
          { _args = [ "SUPER + 4" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 4 })'') ]; }
          { _args = [ "SUPER + 5" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 5 })'') ]; }

          # Workspaces Move Window
          { _args = [ "SUPER + SHIFT + 1" (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 1 })'') ]; }
          { _args = [ "SUPER + SHIFT + 2" (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 2 })'') ]; }
          { _args = [ "SUPER + SHIFT + 3" (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 3 })'') ]; }
          { _args = [ "SUPER + SHIFT + 4" (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 4 })'') ]; }
          { _args = [ "SUPER + SHIFT + 5" (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 5 })'') ]; }

          # Mouse
          { _args = [ "SUPER + mouse:272" (lib.generators.mkLuaInline ''hl.dsp.window.drag()'') { mouse = true; } ]; }
          { _args = [ "SUPER + mouse:273" (lib.generators.mkLuaInline ''hl.dsp.window.resize()'') { mouse = true; } ]; }

        # Media
          { _args = [ "XF86AudioMute" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'') { locked = true; } ]; }
          { _args = [ "XF86AudioLowerVolume" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'') { locked = true; repeating = true; } ]; }
          { _args = [ "XF86AudioRaiseVolume" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")'') { locked = true; repeating = true; } ]; }
        ];

        # Window Rules
        window_rule = [
          # General
          { match = { class = ".*"; }; suppress_event = "maximize"; }
          { match = { class = "^$"; title = "^$"; float = true; fullscreen = false; pin = false; xwayland = true; }; no_focus = true; }

          # Clipse
          { match = { class = "clipse"; }; float = true; center = true; size = "622 652"; stay_focused = true; }

          # gThumb
          { match = { class = "org.gnome.gThumb"; }; tile = true; }

          # Nvim
          { match = { class = "nvim"; }; float = true; center = true; size = "monitor_w*0.75 monitor_h*0.75"; }

          # Picture-in-Picture
          { match = { title = "Picture-in-Picture"; }; float = true; pin = true; size = "monitor_w*0.25 monitor_h*0.25"; move = "monitor_w*0.75-25 monitor_h*0.75-25"; }

          # Steam
          { match = { class = "steam"; }; workspace = "1 silent"; }
          { match = { class = "steam_app_0"; }; float = true; center = true; }

          # Sushi
          { match = { class = "org.gnome.NautilusPreviewer"; }; float = true; center = true; size = "monitor_w*0.35 monitor_h*0.75"; }

          # Tv
          { match = { class = "tv"; }; float = true; center = true; size = "monitor_w*0.75 monitor_h*0.75"; }

          # Upscayl
          { match = { class = "Upscayl"; }; tile = true; }

          # Xdg
          { match = { class = "xdg-desktop-portal-gtk"; }; tile = true; }
        ];
      };
    };

    home.packages = with pkgs; [
      grim
      slurp
    ];
  };
}
