{ ... }:
{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "shonh" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
