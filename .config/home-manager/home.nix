
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
  # changes in each release.

  home.packages = with pkgs;[
    fzf
    jq
    ripgrep
    neovim
    gimp-with-plugins
    gimpPlugins.gmic
    chezmoi
    zsh
    watchman
  ];
  

  programs.home-manager.enable = true;
  programs.bat.enable = true;
}
