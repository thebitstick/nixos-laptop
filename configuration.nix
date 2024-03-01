{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hosts/UTM/hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;

  networking = {
    hostName = "Jorges-Laptop-Ultra";
    nameservers = [ # Cloudflare DNS
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
    networkmanager.enable = true;
  };
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

  users.users.thebitstick = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    description = "TheBitStick";
    shell = pkgs.nushell;
  };

  environment = {
    systemPackages = with pkgs; [
      # Terminal Utilities
      android-tools
      fastfetch
      ffmpeg
      git
      imagemagick
      inetutils
      neovim
      nmap
      scrcpy
      wget
      yt-dlp
      
      # Terminal Replacement Utilities
      bat
      du-dust
      duf
      eza
      fd
      
      # Programming Languages
      bun
      cargo
      crystal
      nushell
      
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
    
    variables = {
      EDITOR = "nvim";
      VISUAL = "codium";
    };
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings.experimental-features = ["nix-command" "flakes"];
  };
  system.stateVersion = "23.11";
}
