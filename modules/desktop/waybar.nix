{ config, lib, pkgs, ... }:

let
  color = import ../../var/color.nix;
in
{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "bottom";
      position = "top";
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
        format = "󱄅 Apps";
        on-click = "sleep 0.2; rofi -show drun -replace -i -run-command \"uwsm app -- {cmd}\"";
      };

      "wlr/taskbar" = {
        tooltip = false;
        format = "{icon}";
        icon-size = 16;
        on-click = "activate";
        on-click-middle = "close";
      };

      "hyprland/window" = {
        tooltip = false;
        format = "{}";
        max-length = 60;
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
        tooltip = false;
        format = "<span>{icon}</span>  {volume}%";
        format-muted = " muted";
        format-icons = {
          headphone = "";
          default = [ "" "" "󰕾" "" ];
        };
        scroll-step = 5;
        on-click = "pwvucontrol";
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
      /* General */
      * {
          font-family: JetBrains Mono Nerd Font;
          border: none;
          border-radius: 0px;
      }

      #waybar {
          background: transparent;
          border-bottom: 0px solid #${color.base07-hex};
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
          color: #${color.base00-hex};
          background-color: #${color.base07-hex};
      }

      #custom-appmenu:hover {
          color: #${color.base07-hex};
          background: #${color.base08-hex};
      }

      /* Taskbar */
      #taskbar {
          margin: 5px 10px;
          padding: 0px 10px;
          border-radius: 15px;
          background: #${color.base07-hex};
      }

      #taskbar button {
          margin: 5px;
          border-radius: 15px;
          padding: 0px 5px;
      }

      #taskbar button.active,
      #taskbar button:hover {
          color: #${color.base07-hex};
          background: #${color.base08-hex};
      }

      /* Window */
      #window {
          margin: 5px 10px;
          padding: 0px 10px;
          border-radius: 15px;
          font-size: 16px;
          color: #${color.base00-hex};
          background: #${color.base07-hex};
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
          color: #${color.base00-hex};
          background: #${color.base07-hex};
      }

      #workspaces button {
          margin: 5px;
          padding: 0px 5px;
          border-radius: 15px;
          font-size: 12px;
          font-weight: bold;
          color: #${color.base07-hex};
          background: #${color.base12-hex};
          transition: all 0.3s ease-in-out;
      }

      #workspaces button.active,
      #workspaces button:hover {
          color: #${color.base00-hex};
          background: #${color.base08-hex};
      }

      /* Bluetooth */
      #bluetooth {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bold;
          color: #${color.base00-hex};
          background-color: #${color.base07-hex};
      }

      #bluetooth:hover {
          color: #${color.base07-hex};
          background: #${color.base08-hex};
      }

      /* Pulseaudio */
      #pulseaudio {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bold;
          color: #${color.base00-hex};
          background-color: #${color.base07-hex};
      }

      #pulseaudio:hover {
          color: #${color.base07-hex};
          background: #${color.base08-hex};
      }

      /* Clock */
      #clock {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bold;
          color: #${color.base00-hex};
          background-color: #${color.base07-hex};
      }

      /* Custom Hypridle */
      #custom-hypridle {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bolder;
          color: #${color.base00-hex};
          background-color: #${color.base07-hex};
      }

      #custom-hypridle:hover {
          color: #${color.base07-hex};
          background: #${color.base08-hex};
      }

      /* Custom Exit */
      #custom-exit {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bolder;
          color: #${color.base00-hex};
          background-color: #${color.base07-hex};
      }

      #custom-exit:hover {
          color: #${color.base07-hex};
          background: #${color.base08-hex};
      }
    '';
  };
}
