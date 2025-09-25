{ pkgs, ... }: 

{
  users.users.shonh.packages = with pkgs; [
    grimblast
    hyprpicker
  ];

  services = {
    upower.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };
}