{ config, pkgs, ... } :

{
  # center new windows for gnome, dconf setting for home manager
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
  
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}