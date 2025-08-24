{ pkgs, ... }: 

{
  users.users.shonh.packages = with pkgs; [
    grimblast
    hyprpicker
  ];
  services.upower.enable = true;
}