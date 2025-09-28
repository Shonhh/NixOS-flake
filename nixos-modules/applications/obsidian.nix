{ pkgs, ... }: {
  users.users.shonh.packages = with pkgs;[
    (wrapWithWaylandFlags obsidian)
  ];
}