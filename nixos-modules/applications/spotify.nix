{ pkgs, ... }: {
  users.users.shonh.packages = with pkgs; [
    spotify
    spicetify-cli
  ];
}
