{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;

  networking.networkmanager.enable = true;
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    xserver = {
      enable = true;
      autorun = true;
      xkb.layout = "us";
      libinput = {
        enable = true;
        touchpad.tapping = true;
      };
      displayManager.gdm = {
        enable = true;
      };
      desktopManager.gnome = {
        enable = true;
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    spice-vdagentd.enable = true;
    qemuGuest.enable = true;
    flatpak.enable = true;
    printing.enable = true;
    openssh.enable = true;
  };

  sound.enable = true;
  security.rtkit.enable = true;
  hardware = {
    pulseaudio.enable = false;
    # opengl.driSupport32Bit = true;
  };
  powerManagement.enable = true;

  environment = {
    systemPackages = with pkgs; [
      # Graphical Apps
      # arduino-ide (x86_64 only)
      baobab
      celluloid
      cura
      # discord (x86_64 only)
      firefox
      obs-studio
      obsidian
      openscad
      prismlauncher
      # (some rss reader)
      # sidequest (x86_64 only)
      tenacity
      # tetrio-desktop (x86_64 only)
      transmission
      vscodium
    ];

    gnome.excludePackages = with pkgs.gnome; [
      gnome-calendar
      gnome-contacts
      gnome-maps
      gnome-music
      totem
      yelp
    ];
  };
}