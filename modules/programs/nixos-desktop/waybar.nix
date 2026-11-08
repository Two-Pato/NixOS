{ config, ... }:
{
  flake.homeModules.nixos-desktop = {
    programs.waybar = {
      enable = true;

      settings = [
        {
          layer = "bottom";
          margin-bottom = 0;
          margin-left = 10;
          margin-right = 10;
          margin-top = 10;
          position = "top";
          spacing = 0;

          modules-left = [
            "custom/appmenu"
            "custom/tray"
            "wlr/taskbar"
            "hyprland/window"
          ];

          modules-center = [
            "hyprland/workspaces"
          ];

          modules-right = [
            "network"
            "bluetooth"
            "pulseaudio"
            "clock"
            "custom/hypridle"
            "custom/exit"
          ];

          # Modules
          "custom/appmenu" = {
            format = "󱄅";
            on-click = "sleep 0.2; uwsm app -- rofi -show drun -replace -i -run-command \"uwsm app -- {cmd}\"";
            tooltip = false;
          };

          "custom/tray" = {
            format = "󰙵 |";
            on-click = "uwsm app -- kitty tray-tui";
            tooltip = false;
          };

          "wlr/taskbar" = {
            format = "{icon}";
            icon-size = 16;
            on-click = "activate";
            on-click-middle = "close";
            tooltip = false;
          };

          "hyprland/window" = {
            format = "{}";
            max-length = 60;
            tooltip = false;
          };

          "hyprland/workspaces" = {
            active-only = false;
            all-outputs = true;
            on-click = "activate";
            persistent-workspaces = {
              "*" = 5;
            };
          };

          network = {
            format-disconnected = "  Disconnected";
            format-ethernet = " ";
            format-linked = "  Linked (No IP)";
            format-wifi = "  {essid}";
            tooltip = false;
          };

          bluetooth = {
            format-connected-battery = " {device_alias} {device_battery_percentage}%";
            on-click = "uwsm app -- blueman-manager";
          };

          pulseaudio = {
            format = "{icon}  {volume}%";
            format-icons = {
              headphone = "";
              default = [
                ""
                ""
                "󰕾"
                ""
              ];
            };
            format-muted = " muted";

            on-click = "uwsm app -- pwvucontrol";
            scroll-step = 5;
            tooltip = false;
          };

          clock = {
            format = "{:%H:%M %a %d %b}";
            tooltip = false;
          };

          "custom/hypridle" = {
            escape = true;
            exec-on-event = true;
            format = "  ";
            on-click = "uwsm app -- hyprlock";
            return-type = "json";
            tooltip = false;
          };

          "custom/exit" = {
            format = " ";
            on-click = "uwsm app -- wlogout";
            tooltip = false;
          };
        }
      ];

      style = ''
        * {
          font-family: JetBrains Mono Nerd Font;
          border: none;
          border-radius: 0px;
        }

        #waybar {
          background: rgba(255, 252, 249, 0.5);
          border-radius: 15px 15px 15px 15px;
          transition-property: background-color;
          transition-duration: 0.5s;
        }

        #custom-appmenu {
          margin: 0px 0px 0px 0px;
          padding: 0px 15px;
          border-radius: 15px 0px 0px 15px;
          font-size: 20px;
          font-weight: bolder;
          color: #${config.colors.base00-hex};
          background-color: #${config.colors.base07-hex};
        }

        #custom-appmenu:hover {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base08-hex};
        }

        #custom-tray {
          margin: 0px 0px 0px 0px;
          padding: 0px 15px;
          border-radius: 0px;
          font-size: 16px;
          font-weight: bold;
          color: #${config.colors.base00-hex};
          background-color: #${config.colors.base07-hex};
        }

        #custom-tray:hover {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base08-hex};
        }

        #taskbar {
          margin: 0px 10px 0px 0px;
          padding: 0px 10px;
          border-radius: 0px 0px 0px 0px;
          background: #${config.colors.base07-hex};
        }

        #taskbar button {
          margin: 10px 5px 10px 5px;
          border-radius: 15px;
          padding: 0px 5px;
        }

        #taskbar button.active,
        #taskbar button:hover {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base08-hex};
        }

        #window {
          margin: 5px 10px;
          padding: 0px 10px;
          border-radius: 15px;
          font-size: 16px;
          color: #${config.colors.base00-hex};
          background: #${config.colors.base07-hex};
        }

        #waybar.empty #window {
          background-color: transparent;
        }

        #workspaces {
          margin: 5px 10px;
          padding: 0px 1px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bold;
          color: #${config.colors.base00-hex};
          background: #${config.colors.base07-hex};
        }

        #workspaces button {
          margin: 5px;
          padding: 0px 5px;
          border-radius: 15px;
          font-size: 12px;
          font-weight: bold;
          color: #${config.colors.base07-hex};
          background: #${config.colors.base12-hex};
          transition: all 0.3s ease-in-out;
        }

        #workspaces button.empty {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base05-hex};
        }

        #workspaces button.active,
        #workspaces button:hover {
          color: #${config.colors.base00-hex};
          background: #${config.colors.base08-hex};
        }

        #network {
          margin: 5px 0px 5px 10px;
          padding: 0px 15px;
          border-radius: 15px 0px 0px 15px;
          font-size: 16px;
          font-weight: bold;
          color: #${config.colors.base00-hex};
          background-color: #${config.colors.base07-hex};
        }

        #network:hover {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base08-hex};
        }

        #bluetooth {
          margin: 5px 0px 5px 0px;
          padding: 0px 15px;
          border-radius: 0px;
          font-size: 16px;
          font-weight: bold;
          color: #${config.colors.base00-hex};
          background-color: #${config.colors.base07-hex};
        }

        #bluetooth:hover {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base08-hex};
        }

        #pulseaudio {
          margin: 5px 10px 5px 0px;
          padding: 0px 15px;
          border-radius: 0px 15px 15px 0px;
          font-size: 16px;
          font-weight: bold;
          color: #${config.colors.base00-hex};
          background-color: #${config.colors.base07-hex};
        }

        #pulseaudio:hover {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base08-hex};
        }

        #clock {
          margin: 5px 10px;
          padding: 0px 15px;
          border-radius: 15px;
          font-size: 16px;
          font-weight: bold;
          color: #${config.colors.base00-hex};
          background-color: #${config.colors.base07-hex};
        }

        #clock:hover {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base08-hex};
        }

        #custom-hypridle {
          margin: 0px 0px 0px 10px;
          padding: 0px 15px;
          border-radius: 0px 0px 0px 0px;
          font-size: 20px;
          font-weight: bolder;
          color: #${config.colors.base00-hex};
          background-color: #${config.colors.base07-hex};
        }

        #custom-hypridle:hover {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base08-hex};
        }

        #custom-exit {
          margin: 0px 0px 0px 0px;
          padding: 0px 15px;
          border-radius: 0px 15px 15px 0px;
          font-size: 20px;
          font-weight: bolder;
          color: #${config.colors.base00-hex};
          background-color: #${config.colors.base07-hex};
        }

        #custom-exit:hover {
          color: #${config.colors.base07-hex};
          background: #${config.colors.base08-hex};
        }
      '';
    };
  };
}
