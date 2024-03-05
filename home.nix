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
    bun
    cargo
    crystal
    nushell
    rustc
  ];

  programs.git = {
    enable = true;
    userName = "TheBitStick";
    userEmail = "the@bitstick.rip";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}