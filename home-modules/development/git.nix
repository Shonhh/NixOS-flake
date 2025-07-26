{ ... }: 

{
  programs.git = {
    enable = true;
    userName = "Shonhh";
    userEmail = "endinja.versitile@gmail.com";

    config.credential = {
      helper = "manager";
      "https://github.com".username = "Shonhh";
      credentialStore = "cache";
    };
  };
}
