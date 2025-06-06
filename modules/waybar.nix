{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      margin-top = 10;
      margin-bottom = 0;
      margin-left = 10;
      margin-right = 10;
      spacing = 0;

      modules-left = [
        "custom/appmenu"
        "wlr/taskbar"
        "hyprland/window"
      ];

      modules-center = [
        "hyprland/workspaces"
      ];

      modules-right = [
        "bluetooth"
        "pulseaudio"
        "clock"
        "custom/hypridle"
        "custom/exit"
      ];

      # Modules
      "custom/appmenu" = {
        tooltip = false;
        format = " Apps";
        on-click = "sleep 0.2; pkill rofi || rofi -show drun -replace";
      };

      "wlr/taskbar" = {
        tooltip = false;
        format = "{icon}";
        icon-size = 16;
        on-click = "activate";
        on-click-middle = "close";
      };

      "hyprland/window" = {
        format = "{}";
        max-length = 60;
        tooltip = false;
      };

      "hyprland/workspaces" = {
        on-click = "activate";
        active-only = false;
        all-outputs = true;
        format = "{}";
        format-icons = {
          urgent = "";
          active = "";
          default = "";
        };
        persistent-workspaces = {
          "*" = 5;
        };
      };

      bluetooth = {
        format-connected-battery = " {device_alias} {device_battery_percentage}%";
        on-click = "blueman-manager";
      };

      pulseaudio = {
        format = "<span>{icon}</span>  {volume}%";
        format-muted = " muted";
        tooltip = false;
        format-icons = {
          headphone = "";
          default = [ "" "" "󰕾" "" ];
        };
        scroll-step = 5;
      };

      clock = {
        tooltip = false;
        format = "{:%H:%M %a}";
      };

      "custom/hypridle" = {
        tooltip = false;
        format = " Log Out";
        return-type = "json";
        escape = true;
        exec-on-event = true;
        on-click = "hyprlock";
      };

      "custom/exit" = {
        tooltip = false;
        format = " Laurent";
        on-click = "wlogout";
      };
    }];

    style = ''
      /* Define Colors */
      @define-color seasalt rgb(251, 249, 248);
      @define-color mountbatten-pink rgb(149, 117, 128);
      @define-color eerie-black rgb(28, 29, 33);
      @define-color cherry-blossom-pink rgb(240, 172, 183);

      /* General */
      * {
          font-family: JetBrains Mono Nerd Font;
          border: none;
          border-radius: 0px;
      }

      #waybar {
          background: transparent;
          border-bottom: 0px solid @seasalt;
          transition-property: background-color;
          transition-duration: 0.5s;
      }

      /* Custom Appmenu */
      #custom-appmenu {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bolder;
          color: @eerie-black;
          background-color: @seasalt;
      }

      #custom-appmenu:hover {
          color: @seasalt;
          background: @cherry-blossom-pink;
      }

      /* Taskbar */
      #taskbar {
          margin: 5px 10px;
          padding: 0px 10px;
          border-radius: 15px;
          background: @seasalt;
      }

      #taskbar button {
          margin: 5px;
          border-radius: 15px;
          padding: 0px 5px;
      }

      #taskbar button.active,
      #taskbar button:hover {
          color: @seasalt;
          background: @cherry-blossom-pink;
      }

      /* Window */
      #window {
          margin: 5px 10px;
          padding: 0px 10px;
          border-radius: 15px;
          font-size: 16px;
          color: @eerie-black;
          background: @seasalt;
      }

      #waybar.empty #window {
          background-color: transparent;
      }

      /* Workspaces */
      #workspaces {
          margin: 5px 10px;
          padding: 0px 1px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bold;
          color: @eerie-black;
          background: @seasalt;
      }

      #workspaces button {
          margin: 5px;
          padding: 0px 5px;
          border-radius: 15px;
          font-size: 12px;
          font-weight: bold;
          color: @seasalt;
          background: @mountbatten-pink;
          transition: all 0.3s ease-in-out;
      }

      #workspaces button.active,
      #workspaces button:hover {
          color: @seasalt;
          background: @cherry-blossom-pink;
      }

      /* Bluetooth */
      #bluetooth {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bold;
          color: @eerie-black;
          background-color: @seasalt;
      }

      #bluetooth:hover {
          color: @seasalt;
          background: @cherry-blossom-pink;
      }

      /* Pulseaudio */
      #pulseaudio {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bold;
          color: @eerie-black;
          background-color: @seasalt;
      }

      #pulseaudio:hover {
          color: @seasalt;
          background: @cherry-blossom-pink;
      }

      /* Clock */
      #clock {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bold;
          color: @eerie-black;
          background-color: @seasalt;
      }

      /* Custom Hypridle */
      #custom-hypridle {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bolder;
          color: @eerie-black;
          background-color: @seasalt;
      }

      #custom-hypridle:hover {
          color: @seasalt;
          background: @cherry-blossom-pink;
      }

      /* Custom Exit */
      #custom-exit {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bolder;
          color: @eerie-black;
          background-color: @seasalt;
      }

      #custom-exit:hover {
          color: @seasalt;
          background: @cherry-blossom-pink;
      }
    '';
  };
}
