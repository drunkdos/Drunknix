{ config, lib, pkgs, pkgs-unstable, ... }:
{
# enable zsh and oh my zsh
users.defaultUserShell = pkgs.fish;
programs = {
   zsh = {
      enable = true;
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      # promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      ohMyZsh = {
         enable = true;
         theme = "bira";
         plugins = [
           "git"
           "npm"
           "history"
           "node"
           "rust"
           "deno"
	   "fzf"
         ];
      };
   };
};

  programs.fish.enable = true;

}
