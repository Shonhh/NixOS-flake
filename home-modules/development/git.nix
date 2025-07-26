{ pkgs, ... }: 

{
  programs.git = {
    enable = true;
    userName = "Shonhh";
    userEmail = "endinja.versitile@gmail.com";

    extraConfig = {
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };
}
