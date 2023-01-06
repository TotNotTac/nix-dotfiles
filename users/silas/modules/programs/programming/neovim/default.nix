{ pkgs, ... }:
let
  customPlugins = {
    # fireNVim = pkgs.vimUtils.buildVimPlugin {
    #   name = "firenvim";
    #   src = pkgs.fetchgit {
    #     url = "https://github.com/glacambre/firenvim";
    #     rev = "37d06a579b8459b140ab65d64b030fcc5f286935";
    #     sha256 = "1qf7mrm0b0z9h1jybf4jn38kg3g9q3lj3vhdrzs9yhyy5jncp700";
    #   };
    # };
  };
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-nix
      gruvbox
      orgmode
      leap-nvim
    ];
    extraConfig = ''
      lua require('leap').add_default_mappings()

      lua vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
      lua vim.api.nvim_set_hl(0, 'LeapMatch', {fg = 'white', bold = true, nocombine = true,})
      lua require('leap').opts.highlight_unlabeled_phase_one_targets = true

      colorscheme gruvbox
      tnoremap <A-Esc> <C-\><C-n>
      tnoremap <A-h> <C-\><C-N><C-w>h
      tnoremap <A-j> <C-\><C-N><C-w>j
      tnoremap <A-k> <C-\><C-N><C-w>k
      tnoremap <A-l> <C-\><C-N><C-w>l
      inoremap <A-h> <C-\><C-N><C-w>h
      inoremap <A-j> <C-\><C-N><C-w>j
      inoremap <A-k> <C-\><C-N><C-w>k
      inoremap <A-l> <C-\><C-N><C-w>l
      nnoremap <A-h> <C-w>h
      nnoremap <A-j> <C-w>j
      nnoremap <A-k> <C-w>k
      nnoremap <A-l> <C-w>l

      set nu rnu
    '';
  };
}
