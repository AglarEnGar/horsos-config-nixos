{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.catppuccin.homeManagerModules.catppuccin
    ./tmux.nix
    ./zshrc.nix
    ./flatpak.nix
    ./kitty.nix
    ./theme.nix
  ];
  
  home.username = "nickd";
  home.homeDirectory = "/home/nickd";
  home.stateVersion = "24.05";

  # git config
  programs.git = {
    enable = true;
    userName = "AglarEnGar";
    userEmail = "luca.j.morgan@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };  
  };

  programs.home-manager.enable = true;
}
