{ config, lib, pkgs, hostName, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      bookmarks.force = true;
      bookmarks.settings = [
        {
          name = "Google";
          url = "https://www.google.com/";
        }
        {
          name = "YouTube";
          url = "https://www.youtube.com/";
        }
        {
          name = "ChatGPT";
          url = "https://chatgpt.com/";
        }
        {
          name = "GitHub";
          url = "https://github.com/";
        }
        {
          name = "Convert Case";
          url = "https://convertcase.net/";
        }
        {
          name = "Kavita";
          url = "https://kavita.nexuinque.de/home/";
        }
        {
          name = "Proxmox";
          url = "https://proxmox.nexuinque.de/";
        }
        {
          name = "Reddit";
          url = "https://www.reddit.com/";
        }
        {
          name = "Jellyfin";
          url = "https://jellyfin.nexuinque.de/";
        }
        {
          name = "The Movie Database";
          url = "https://www.themoviedb.org/";
        }
        {
          name = "Stirling PDF";
          url = "https://stirling.nexuinque.de/";
        }
        {
          name = "JLearn";
          url = "https://jlearn.net/";
        }
        {
          name = "MyNixOS";
          url = "https://mynixos.com/";
        }
        {
          name = "Proton Mail";
          url = "https://account.proton.me/mail/";
        }
        {
          name = "SimpleLogin";
          url = "https://app.simplelogin.io/dashboard/";
        }
      ];

      settings = {
        "font.default.x-western" = "serif";
        "font.name.serif.x-western" = "Noto Serif";
        "font.minimum-size.x-western" = 0;
        "toolkit.zoomManager.zoomValues" = ".25,.5,.75,1,1.25,1.5,1.75,2";

        "browser.onboarding.enabled" = false;
        "browser.startup.page" = 3;
        "browser.tabs.closeWindowWithLastTab" = false;
        "browser.toolbars.bookmarks.visibility" = "never";

        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "extensions.htmlaboutaddons.discover.enabled" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;

        "browser.translations.automaticallyPopup" = false;
        "browser.translations.enable" = false;

        "browser.ml.enabled" = false;
        "browser.ml.chat.enabled" = false;
        "browser.ml.linkPreview.enabled" = false;

        "browser.uitour.enabled" = false;

        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.aboutConfig.showWarning" = false;

        "browser.uiCustomization.state" = ''{
          "placements": {
            "widget-overflow-fixed-list": [],
            "unified-extensions-area": [
              "_f8e12521-acde-4a17-9f1f-c10a32d053e2_-browser-action"
            ],
            "nav-bar": [
              "back-button",
              "forward-button",
              "stop-reload-button",
              "home-button",
              "vertical-spacer",
              "customizableui-special-spring1",
              "urlbar-container",
              "customizableui-special-spring2",
              "bookmarks-menu-button",
              "history-panelmenu",
              "downloads-button",
              "unified-extensions-button",
              "ublock0_raymondhill_net-browser-action"
              ${lib.strings.optionalString (hostName == "mihari") ", \"78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action\""}
            ],
            "toolbar-menubar": [
              "menubar-items"
            ],
            "TabsToolbar": [
              "firefox-view-button",
              "tabbrowser-tabs",
              "new-tab-button",
              "alltabs-button"
            ],
            "vertical-tabs": [],
            "PersonalToolbar": [
              "import-button",
              "personal-bookmarks"
            ]
          },
          "seen": [
            "save-to-pocket-button",
            "developer-button",
            "ublock0_raymondhill_net-browser-action",
            "_f8e12521-acde-4a17-9f1f-c10a32d053e2_-browser-action",
            ${lib.strings.optionalString (hostName == "mihari") "\"78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action\","}
            "screenshot-button"
          ],
          "dirtyAreaCache": [
            "nav-bar",
            "vertical-tabs",
            "PersonalToolbar",
            "toolbar-menubar",
            "TabsToolbar",
            "unified-extensions-area"
          ],
          "currentVersion": 22,
          "newElementCount": 3
        }'';
      };
    };

    policies = {
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DontCheckDefaultBrowser = true;
      PasswordManagerEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      ExtensionSettings = lib.mkMerge [
        {
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };

          "{f558e0b7-ded4-4803-a06f-3dcc5a8cc37e}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4522550/easy_speed_dial/latest.xpi";
            installation_mode = "force_installed";
          };
        }

        (lib.optionalAttrs (hostName == "mihari") {
          "jid1-xUfzOsOFlzSOXg@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/reddit-enhancement-suite/latest.xpi";
            installation_mode = "force_installed";
          };

          "{f8e12521-acde-4a17-9f1f-c10a32d053e2}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/3423739/save_all_tab_urls-0.1.4.xpi";
            installation_mode = "force_installed";
          };
        })
      ];
    };
  };
}
