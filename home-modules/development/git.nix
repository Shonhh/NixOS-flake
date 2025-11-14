{ pkgs, ... }: 

{
  programs.git = {
    enable = true;

    settings.user = {
      name = "Shonhh";
      email = "endinja.versitile@gmail.com";
    };
  };
}
