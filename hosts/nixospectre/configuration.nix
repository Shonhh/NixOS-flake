# Edit this configuration file to define what should be installed on

# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default

    ../../nixos-modules/default.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # `systemd` Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  boot = {

    # `GRUB` Bootloader.
    loader = {
      timeout = 1;
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        devices = [ "nodev" ];
        enable = true;
        efiSupport = true;
        useOSProber = true;
        splashImage = null;

        # Spam f4 to show grub menu
        timeoutStyle = "hidden";

        extraEntries = ''
          menuentry "Shutdown" {
            halt
          }

          menuentry "Reboot" {
            reboot
          }
        '';
      };
    };

    # Use zen kernel
    kernelPackages = pkgs.linuxPackages_zen;

    # Enable boot animation
    plymouth = {
      enable = true;
      theme = "loader_2";
      themePackages = with pkgs; [
        adi1090x-plymouth-themes
      ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
    ];
  };

  networking.hostName = "Nixon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services = {
    # Enable battery management
    tlp.enable = true;
    # Enable CUPS for printing
    printing.enable = true;
    # Enable auto-mounting of removable media
    gvfs.enable = true;

    # Configure keymap in X11
    xserver = {
      videoDrivers = [ "modesetting" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shonh = {
    isNormalUser = true;
    description = "Shonh";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "video"
      "audio"
      "plugdev"
    ];

    packages = with pkgs; [
      prismlauncher
      pipes-rs
      cmatrix
      cbonsai
    ];

    shell = pkgs.fish;
  };

  programs = {
    fish.enable = true;
    nix-ld.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "shonh".imports = [
        ./home.nix
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
        intel-compute-runtime
      ];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    brightnessctl
    nixfmt-rfc-style
    nixd
    networkmanagerapplet
    unzip
    wineWowPackages.stable
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
