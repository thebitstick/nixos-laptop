{ config, lib, pkgs, ... }:

{
  imports = [
    ./hosts/UTM/hardware-configuration.nix
    ./linux.nix
  ];

  networking = {
    hostName = "Jorges-Laptop-Ultra";
    nameservers = [ # Cloudflare DNS
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };

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
