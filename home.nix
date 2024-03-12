{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "org.gnome.Epiphany.desktop"
        "org.gnome.Console.desktop"
        "codium.desktop"
      ];
    };
  };

  home.packages = with pkgs; [
    # Terminal Utilities
    android-tools
    fastfetch
    ffmpeg
    imagemagick
    nixpkgs-fmt
    scrcpy
    yt-dlp

    # Programming Languages
    cargo
    nushell
    rustc

    # Graphical Apps
    # arduino-ide (x86_64 only)
    baobab
    # celluloid
    # cura
    # discord (x86_64 only)
    firefox
    # keepassxc
    # obs-studio
    # obsidian
    # openscad
    # prismlauncher
    # (some rss reader)
    # sidequest (x86_64 only)
    # tenacity
    # tetrio-desktop (x86_64 only)
    # transmission
    vscodium
  ];

  programs.git = {
    enable = true;
    userName = "TheBitStick";
    userEmail = "the@bitstick.rip";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
