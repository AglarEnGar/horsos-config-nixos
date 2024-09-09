{pkgs, config, ...}:
{

  gtk = {
    enable = true;

    iconTheme = {
      name = "Numix-Circle";
      package = pkgs.numix-icon-theme-circle;
    };
    
    catppuccin = {
      enable = true;
      accent = "lavender";
      flavor = "macchiato";
    };

    cursorTheme = {
      package = pkgs.volantes-cursors;
      name = "volantes_cursors";
    };

    gtk3.extraConfig = {
      Settings = ''
      gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}

