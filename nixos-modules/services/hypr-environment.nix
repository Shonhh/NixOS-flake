{ pkgs, ... }: 

{
  users.users.shonh.packages = with pkgs; [
    grimblast
    hyprpicker
  ];

  services = {
    upower.enable = true;
  };


  # Enable flatpak
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Enable xdg-desktop-portal systemwide for hyprland
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];

    config = {
      common = {
        default = [ "hyprland" ];
      };
    };
  };
}