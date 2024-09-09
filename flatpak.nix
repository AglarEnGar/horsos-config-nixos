{ config, pkgs, ... }:

{
  services.flatpak = {
    update.onActivation = true;

    remotes = [
      { name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo"; }
    ];

    packages = [
      { appId = "dev.vencord.Vesktop"; origin = "flathub"; }
      { appId = "com.obsproject.Studio"; origin = "flathub"; }
    ];
  };

  home.file = {
    ".local/share/flatpak/overrides/dev.vencord.Vesktop".text = ''
      [Context]
      filesystems=home

      [Session Bus Policy]
      org.freedesktop.Notifications=talk
    '';
  };
}

