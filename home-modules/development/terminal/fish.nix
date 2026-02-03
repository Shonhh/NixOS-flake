{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function fish_greeting
      end
    '';

    shellInit = ''
      if test -f ~/.config/secrets/gemini.fish
        source ~/.config/secrets/gemini.fish
      end
    '';

    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
    ];

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos/#nixospectre";
    };

  };

  programs.bash = {
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  home.packages = [ pkgs.grc ];
}
