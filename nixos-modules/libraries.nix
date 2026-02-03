{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    mesa-demos
    vulkan-tools
    mesa-demos
    usbutils
  ];
}
