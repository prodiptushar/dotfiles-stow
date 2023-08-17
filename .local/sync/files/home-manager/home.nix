{ config, pkgs, ... }:
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
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "prodip";
  home.homeDirectory = "/home/prodip";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
      patches = (oa.patches or [ ]) ++ [
        (pkgs.fetchpatch {
          name = "fix waybar hyprctl";
          url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
          sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
        })
      ];
    });
  };
  # The home.packages option allows you to install Nix packages into your
  # environment.

  home.packages = with pkgs;[
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    brave
    ytfzf
    yt-dlp
    gnumake
    mu
    zathura
    imv
    nsxiv
    pam_gnupg
    docker-compose
    yarn
    rclone
    pass
    cmake
    isync
    foot
    mutt-wizard
    ueberzugpp
    nodePackages.npm
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
    emacs29-pgtk
    libsForQt5.kauth
    btop
    ripgrep
    acpi
    tofi
    fuzzel
    gcc
    stow
    light
    libsForQt5.polkit-kde-agent
    qt6.qtwayland
    gcc-unwrapped
    neovim
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "SourceCodePro" ]; })
    kitty
    zoxide
    wl-clipboard
    ispell
    sqlite
    wordnet
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  programs.git = {
    enable = true;
    userName = "prodiptushar";
    userEmail = "prodiptushar01@gmail.com";
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  xdg.enable = true;
  xdg.mime.enable = true;
  targets.genericLinux.enable = true;


  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/prodip/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
    # Test Cron
  };
  fonts.fontconfig.enable = true;
  programs.bat.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
