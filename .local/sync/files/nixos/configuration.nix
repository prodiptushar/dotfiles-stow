# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = { "vm.swappiness" = 10; };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  # networking.wireless.userControlled.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.zsh.enable = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  # programs.msmtp = {
  #   enable = true;
  #   accounts.default = {
  #     host = "smtp.gmail.com";
  #     from = "prodiptushar01@gmail.com";
  #     user = "prodiptushar01@gmail.com";
  #     password = "bmladlokwpcpogbk";
  #   };
  # };
  users.defaultUserShell = pkgs.zsh;
  users.users.prodip.shell = pkgs.zsh;

  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *      prodip    rsync -av /etc/nixos /home/prodip/.local/dotfiles/.local/sync/files/"
      "*/5 * * * *      prodip    rsync -av /home/prodip/.config/home-manager /home/prodip/.local/dotfiles/.local/sync/files/"
      "*/20 * * * *     prodip    rclone copy /home/prodip/Sync Sync:Sync"
      "*/20 * * * *     prodip    rclone sync /home/prodip/Documents/org Sync:notes"

    ];
  };
  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };



  # Set your time zone.
  time.timeZone = "Asia/Dhaka";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "bn_BD";
    LC_IDENTIFICATION = "bn_BD";
    LC_MEASUREMENT = "bn_BD";
    LC_MONETARY = "bn_BD";
    LC_NAME = "bn_BD";
    LC_NUMERIC = "bn_BD";
    LC_PAPER = "bn_BD";
    LC_TELEPHONE = "bn_BD";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.prodip = {
    isNormalUser = true;
    description = "prodip";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      python3
      nodejs_20
    ];
  };
  services.flatpak.enable = true;
  home-manager.users.prodip = { config, pkgs, ... }:
    let
    tex = (pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-medium
        dvisvgm dvipng# for preview and export as html
        wrapfig amsmath ulem hyperref capt-of;
      #(setq org-latex-compiler "lualatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
        });
  in
  {
  home.packages = with pkgs;[
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    ytfzf
    yt-dlp
    gnumake
    mu
    zathura
    imv
    hugo
    nsxiv
    pam_gnupg
    docker-compose
    rclone
    pass
    cmake
    isync
    foot
    mutt-wizard
    neomutt
    ueberzugpp
    nodePackages.npm
    nodePackages_latest.pnpm
    python310Packages.pip
    dunst
    pcmanfm
    tmux
    tex
    file
    xdg-utils
    fzf
    mpv
    ffmpeg
    aria2
    lf
    lazygit
    gtk3
    linux-firmware
    nnn
    ctpv
    fd
    jq
    firefox-devedition
    htop
    emacs29
    btop
    ripgrep
    acpi
    tofi
    fuzzel
    gcc
    stow
    light
    gcc-unwrapped
    neovim
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "SourceCodePro" ]; })
    zoxide
    wl-clipboard
    ispell
    sqlite
    wordnet
];
# The state version is required and should stay at the version you
  # originally installed.
    home.stateVersion = "23.11";

  programs.git = {
    enable = true;
    userName = "prodiptushar";
    userEmail = "prodiptushar01@gmail.com";
  };

  xdg.enable = true;
  xdg.mime.enable = true;
  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;
  programs.bat.enable = true;



  };


  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # fonts.fonts = with pkgs; [
  #   noto-fonts
  #   noto-fonts-emoji
  #   liberation_ttf
  #   (nerdfonts.override { fonts = [ "FiraCode" "SourceCodePro" ]; })
  # ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    wireguard-tools
    desktop-file-utils
    foot
    libnotify
    curl
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
