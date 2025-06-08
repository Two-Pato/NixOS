{ config, lib, pkgs, ... }:

let
  color = import ../var/color.nix;
in
{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''
      window {
        font-family: "JetBrains Mono", monospace;
        font-size: 2rem;
        font-weight: bolder;
        font-style: normal;
        color: rgba(${color.base00-rgb}, 1);
        background-color: rgba(${color.base00-rgb}, 0.8);
        outline: none;
        border: none;
      }

      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;
        background-color: rgba(${color.base06-rgb}, 1);
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s ease-in;
        box-shadow: 0 0 10px 2px transparent;
        border-radius: 36px;
        margin: 10px;
        outline: none;
        border: none;
      }

      button:focus {
        box-shadow: none;
        background-size: 20%;
        outline: none;
        border: none;
      }

      button:hover {
        background-size: 50%;
        box-shadow: 0 0 10px 3px rgba(0, 0, 0, .4);
        background-color: rgba(${color.base08-rgb}, 1);
        color: rgba(${color.base06-rgb}, 1);
        transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.5s ease-in;
        outline: none;
        border: none;
      }

      #shutdown {
        background-image: url("${../imgs/wlogout_icons/power.png}");
      }

      #shutdown:hover {
        background-image: url("${../imgs/wlogout_icons/power-hover.png}");
      }

      #logout {
        background-image: url("${../imgs/wlogout_icons/logout.png}");
      }

      #logout:hover {
        background-image: url("${../imgs/wlogout_icons/logout-hover.png}");
      }

      #reboot {
        background-image: url("${../imgs/wlogout_icons/restart.png}");
      }

      #reboot:hover {
        background-image: url("${../imgs/wlogout_icons/restart-hover.png}");
      }

      #lock {
        background-image: url("${../imgs/wlogout_icons/lock.png}");
      }

      #lock:hover {
        background-image: url("${../imgs/wlogout_icons/lock-hover.png}");
      }

      #hibernate {
        background-image: url("${../imgs/wlogout_icons/hibernate.png}");
      }

      #hibernate:hover {
        background-image: url("${../imgs/wlogout_icons/hibernate-hover.png}");
      }
    '';
  };
}
