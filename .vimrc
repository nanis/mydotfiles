set nocompatible " Yeah, I know ;-)
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Solarized color scheme
Bundle 'altercation/vim-colors-solarized'
let g:solarized_menu=0

" a tool to lookup annotations for Objective Caml source code
Bundle 'avsm/ocaml-annot'

" Lean & mean status/tabline for vim that's light as air
Bundle 'bling/vim-airline'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
let g:airline_linecolumn_prefix = '¶ '
let g:airline_paste_symbol = 'ρ'
let g:airline_paste_symbol = 'Þ'
let g:airline_paste_symbol = '∥'
let g:airline_enable_branch=1
let g:airline_branch_prefix='⎇ '
let g:airline_theme='base16'

" vim syntax highlighting for c, bison, flex
Bundle 'justinmk/vim-syntax-extra'

" Fuzzy file, buffer, mru, tag, etc finder
Bundle 'kien/ctrlp.vim'

" Mercurial wrapper for Vim
Bundle 'ludovicchabant/vim-lawrencium'

" Vim plugin that displays tags in a window, ordered by class etc
Bundle 'majutsushi/tagbar'
let g:tagbar_expand = 1
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
nnoremap <silent> <F8> :TagbarToggle<CR>

" Signify uses signs to indicate added, modified and removed lines based on
" data of an underlying version control system.
Bundle 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git', 'hg' ]

" Improved C++11/14 STL syntax highlighting
Bundle 'Mizuchi/STL-Syntax'

" Delete buffers and close files in Vim without closing your windows
Bundle 'moll/vim-bbye'

Bundle 'motemen/xslate-vim'

" HTML5 omnicomplete and syntax
Bundle 'othree/html5.vim'

" provides insert mode auto-completion for quotes, parens, brackets, etc
Bundle 'Raimondi/delimitMate'

" Pencil color scheme
Bundle 'reedes/vim-colors-pencil'

" Extended f, F, t and T key mappings for Vim
Bundle 'rhysd/clever-f.vim'

" Vim plugin for the_silver_searcher, 'ag'
Bundle 'rking/ag.vim'

" Vim sugar for the UNIX shell commands that need it the most
Bundle 'tpope/vim-eunuch'

" a Git wrapper
Bundle 'tpope/vim-fugitive'

" Vim Markdown runtime files
Bundle 'tpope/vim-markdown'

Bundle 'vim-perl/vim-perl'
let perl_include_pod=1
" unlet perl_no_scope_in_variables
" unlet perl_no_extended_vars
" unlet perl_string_as_statement
" unlet perl_no_sync_on_sub
" unlet perl_no_sync_on_global_var
let perl_sync_dist=250
" unlet perl_fold
" unlet perl_fold_blocks
" let perl_nofold_packages = 1
" let perl_nofold_subs = 1

Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'vim-scripts/gnuplot.vim'

Bundle 'vim-scripts/indenthtml.vim'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

Bundle 'vim-scripts/vim-javascript'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/SAS-Indent'
Bundle 'vim-scripts/SAS-Syntax'
Bundle 'vim-scripts/unicode.vim'

syntax on
set background=dark
colorscheme pencil

filetype plugin on
filetype indent on

let MRU_num = 9

let xml_tag_completion_map = "<C-l>"
let xml_use_html = 1
let psc_statement_different_from_type = 1

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let indent_guides_enable_on_vim_startup=1

hi! MatchParen ctermbg=LightRed ctermfg=White guibg=#d75f00 guifg=White

highlight ColorColumn ctermbg=magenta ctermfg=gray guibg=magenta guifg=white
call matchadd('ColorColumn', '\%81v', 100)

if has("autocmd")
    filetype plugin indent on
    au BufRead,BufNewFile *.gp	setfiletype gnuplot

    autocmd! BufRead,BufNewFile *.pl  compiler perl
    autocmd! BufRead,BufNewFile *.plx compiler perl
    autocmd! BufRead,BufNewFile *.pm  compiler perl
    autocmd FileType perl let g:perlhelp_prog="perldoc"
    autocmd FileType perl set errorformat=%f:%l:%m
    autocmd FileType perl set autowrite
    autocmd FileType perl nnoremap <silent> _t :%!perltidy -l=76 -ole=unix -q<Enter>
    autocmd FileType perl vnoremap <silent> _t :!perltidy -l=76 -ole=unix -q<Enter>

    autocmd FileType c,cpp,java,php,perl set number
    autocmd FileType c,cpp,java,php,perl autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

    au BufWritePost * filetype detect
    " set current directory to the directory of the file in the current window
    autocmd BufEnter * :lchdir %:p:h

    augroup CursorLine
        au!
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
        au WinLeave * setlocal nocursorline
        au WinLeave * setlocal nocursorcolumn
    augroup END

endif " has("autocmd")

"change window focus to lower one (cyclic)
nnoremap <s-down>   <c-w>w
"change window focus to upper one (cyclic)
nnoremap <s-up>     <c-w>W
"change window focus to one on left
nnoremap <s-left>   <c-w>h
"change window focus to one on right
nnoremap <s-right>  <c-w>l

" Java highlighting options
let java_highlight_java_lang_ids=1
let java_highlight_all=1
let java_highlight_debug=1
let java_minlines=50
let java_highlight_functions="style"

" HTML Highlighting Options
let html_no_rendering=1

" Split Explorer Options
let g:explVertical=1
let g:explSplitRight=1
let g:explStartRight=0
let g:explDirsFirst=1

" make tab in v mode indent code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode indent code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

let g:DBGRconsoleHeight=7
let g:DBGRlineNumbers=1

" vimwiki
let g:vimwiki_menu = 'Tools.Vimwiki'

set autoindent
set nobackup
set backupdir=~/tmp
set cmdheight=2
set confirm
set nodigraph
set directory=~/tmp
set encoding=utf-8
set expandtab
set fileencodings=''
set formatoptions+=n
set guifont=monoOne:h13
set guioptions-=T
set guioptions+=rl
set helpheight=20
set history=96
set nohlsearch
set ignorecase
set laststatus=2
set list
set listchars=extends:>,tab:→·,trail:·,nbsp:~
set modeline
set mousemodel="popup_setpos"
set number
set scrolloff=12
set sidescroll=1
set sidescrolloff=12
set shiftwidth=4
set showmatch
set splitbelow
set statusline=%F\ %m%=Col:\ %c\ Row:\ \%l\ of\ %L\ (%p%%)
set tabstop=4
set textwidth=76
set title
set updatecount=50
set winaltkeys=menu
set winminheight=0
set wildmenu
set wrap
set writebackup

" Digraphs for Turkish
dig \C 199
dig \c 231
dig \g 287
dig \G 286
dig \I 304
dig \i 305
dig \O 214
dig \o 246
dig \S 350
dig \s 351
dig \U 220
dig \u 252
