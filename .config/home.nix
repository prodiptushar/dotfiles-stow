
{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "prodip";
  home.homeDirectory = "/home/prodip";
  home.stateVersion = "22.11";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # home.file."./.config/nvim/" = {
  #   source = ./nvim;
  #   recursive = true;
  # };
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version

  programs.waybar={
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
        mesonFlags = (oa.mesonFlags or  []) ++ [ "-Dexperimental=true" ];
        patches = (oa.patches or []) ++ [
        (pkgs.fetchpatch {
         name = "fix waybar hyprctl";
         url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
         sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
         })
        ];
        });};
 
  home.packages = with pkgs;[
    fzf
    mpv
    lf
    lazygit
    emacs
    eww-wayland
    ctpv
    cmake
    fd
    jq
    firefox
    htop
    btop
    ripgrep
    acpi
    tofi
    fuzzel
    gcc
    stow
    ani-cli
    neovim
    foot
    noto-fonts-emoji
    nnn
    (nerdfonts.override { fonts = [ "FiraCode" "SourceCodePro"]; })
    kitty
    brave
    gimp-with-plugins
    gimpPlugins.gmic
    tmux
    zsh
    zoxide
    wl-clipboard
    chezmoi
    watchman
  ];
  
  xdg.enable=true;
  xdg.mime.enable=true;
  targets.genericLinux.enable=true; 

  programs.git = {
    enable = true;
    userName  = "prodiptushar";
    userEmail = "prodiptushar01@gmail.com";
  };


  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  programs.bat.enable = true;
}
