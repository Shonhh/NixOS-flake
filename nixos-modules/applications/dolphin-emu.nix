{ pkgs, ... }: {
  services.udev.packages = [ pkgs.dolphin-emu];
  
  users.users.shonh.packages = with pkgs;[
    dolphin-emu
  ];
}