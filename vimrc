" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:


" General {
    
    autocmd! bufwritepost .vimrc source %   " Automatic reloading of .vimrc
    autocmd! bufwritepost .gvimrc source %  " Automatic reloading of .gvimrc
    execute pathogen#infect()

    set nocompatible        " disable vi compatibility.
    set history=256         " Number of things to remember in history.
    set autowrite           " Writes on make/shell commands
    set autoread
    set timeoutlen=250      " Time to wait after ESC

    set pastetoggle=<F2>    " toggle paste insert mode
    set clipboard+=unnamed   

    set encoding=utf-8
    
    set tags=./tags;$HOME   " walk directory tree up to $HOME looking for tags

" }


" Formatting {

    set fo+=o   " Automatically insert the current comment leader 
                " after hitting 'o' or 'O' in Normal mode.
    set fo-=r   " Don't automatically insert a comment leader after an enter
    
    " Wrapping {
        set nowrap          " Don't wrap automatically on load
        set fo-=t           " Don't wrap automatically on typing
        set textwidth=79    " Document width (used by gd)
        set colorcolumn=80  " Adds a vertical colum at pos 80
    " }
    
    
    " Show whitespace
    " MUST be inserted BEFORE the colorscheme command
    " autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    " au InsertLeave * match ExtraWhitespace /\s\+$/

    set wildmode=longest,list   " At command line, complete longest common 
                                " string, then list alternatives.

    set backspace=indent,eol,start  " more powerful backspacing

    " Indentation {
        set tabstop=4       " Set the default tabstop
        set softtabstop=4
        set shiftwidth=4    " Set the default shift width for indents
        set expandtab       " Make tabs into spaces (set by tabstop)
        set smarttab        " Smarter tab levels

        set autoindent
        set cindent
        set cinoptions=:s,ps,ts,cs
        set cinwords=if,else,while,do,for,switch,case

        vnoremap < <gv  " easier moving of code blocks
        vnoremap > >gv  " visual mode, then press < or > several times
    " }

    syntax on   " enable syntax
    filetype off
    filetype plugin indent on   " Automatically detect file types.

" }


" Visual { 

    set number          " Line numbers on
    set showmatch       " Show matching brackets.
    set matchtime=5     " Bracket blinking.
    set novisualbell    " No blinking
    set noerrorbells    " No noise.
    set laststatus=2    " Always show status line.
    set visualbell t_vb= " disable any beeps or flashes on error
        au GuiEnter * set visualbell t_vb=
    set ruler           " Show ruler
    set showcmd         " Display an incomplete command in the lower right 
                        " corner of the Vim window
    set shortmess=atI   " Shortens messages
    set nolist          " Display unprintable characters f12 - switches
    set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« 
                        " Unprintable chars mapping
    " Folding {
        set foldenable          " Turn on folding
        set foldmethod=marker   " Fold on the marker
        set foldlevel=20        " Don't autofold anything 
                                " (but I can still fold manually)
        set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    " }

    set mouse=a         " Enable mouse
    set mousehide       " Hide mouse after chars typed

    set splitbelow
    set splitright

    " Color scheme {
        set t_Co=256
        if !has('gui_running')
            color wombat256mod
            highlight ColorColumn ctermbg=233   " must be set after color scheme
        endif 
    " }

" }


" Plugins {
    " Airline {
        let g:airline_powerline_fonts=1
        let g:Powerline_symbols='fancy'
    " }
" }




" syntax highlightling for arduino projects
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
