{ config, lib, ... }:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        };

      listeners = [
        {
          timeout = 300;  # 5 min
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 900;  # 15 min
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1800;  # 30 min
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
        }
        {
          timeout = 3600;  # 60 min
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
