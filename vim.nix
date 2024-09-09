with import <nixpkgs> {};

vim-full.customize {
  vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
    start = [
      airline
      vim-airline-themes 
      vim-devicons 
      nerdtree 
      tagbar
      nim
      vim-windowswap
    ]; 
  };

  vimrcConfig.customRC = ''
    set backspace=indent,eol,start
    let &fillchars ..= ',eob: '

    let g:airline_theme='papercolor'

    " Airline
    let g:airline_powerline_fonts = 1

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif 

    syntax enable

    let g:airline_symbols.space = "\ua0"

    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ' '
    let g:airline_right_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_left_alt_sep= ''
    let g:airline_left_sep = ''
    """

    set statusline=%t       "tail of the filename
    set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
    set statusline+=%{&ff}] "file format
    set statusline+=%h      "help file flag"
    set statusline+=%m      "modified flag
    set statusline+=%r      "read only flag
    set statusline+=&filetype      "filetype
    set statusline+=%=
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\ %P    "percent through file'

    filetype plugin indent on
    " show existing tab with 4 spaces width
    set tabstop=4
    " when indenting with '>', use 4 spaces width
    set shiftwidth=4
    " On pressing tab, insert 4 spaces
    set expandtab

    :set wrap!

    map <C-n> :call NERDTreeToggleAndRefresh()<CR>

    function NERDTreeToggleAndRefresh()
      :NERDTreeToggle
      if g:NERDTree.IsOpen()
        :NERDTreeRefreshRoot
      endif
    endfunction

    highlight VertSplit cterm=NONE
    set fillchars+=vert:\│

    nmap <silent> <c-w> :wincmd k<CR>
    nmap <silent> <c-s> :wincmd j<CR>
    nmap <silent> <c-a> :wincmd h<CR>
    nmap <silent> <c-d> :wincmd l<CR>

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    nmap <F8> :TagbarToggle<CR>

    let &t_SI .= "\<Esc>[?2004h"
    let &t_EI .= "\<Esc>[?2004l"

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

    function! XTermPasteBegin()
      set pastetoggle=<Esc>[201~
      set paste
    return ""
    endfunction
  '';
}

