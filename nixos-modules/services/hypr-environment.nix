{ pkgs, ... }: 

{
  users.users.shonh.packages = with pkgs; [
    grimblast
    hyprpicker
    upower
  ];
}