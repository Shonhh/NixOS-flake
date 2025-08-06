{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    glxinfo
    vulkan-tools
    mesa-demos
  ];
}
