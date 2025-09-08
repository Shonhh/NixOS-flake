{ pkgs, ... }: {
  services.udev.packages = [ pkgs.dolphinEmu];
  
  users.users.shonh.packages = with pkgs;[
    dolphin-emu
  ];
}