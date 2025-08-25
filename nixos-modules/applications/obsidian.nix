{ pkgs, ... }: {
  users.users.shonh.packages = with pkgs;[
    obsidian
  ];
}