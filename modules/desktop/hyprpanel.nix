{ inputs, pkgs, ... }:

{
  programs.hyprpanel = {
    enable = true;
    package = inputs.hyprpanel.packages.${pkgs.system}.default;
  };
}
