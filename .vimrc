set nocompatible " Yeah, I know ;-)
filetype off

set rtp+=~/.vim/Bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'

" vim syntax highlighting for c, bison, flex
Plugin 'justinmk/vim-syntax-extra'

" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" Vim plugin that displays tags in a window, ordered by class etc
Plugin 'majutsushi/tagbar'

" Improved C++11/14 STL syntax highlighting
Plugin 'Mizuchi/STL-Syntax'

" Delete buffers and close files in Vim without closing your windows
Plugin 'moll/vim-bbye'

" http://xslate.org/
Plugin 'motemen/xslate-vim'

" My light colorscheme. It may be a misdemeanor against good taste
" Plugin 'nanis/nonfelony'

" HTML5 omnicomplete and syntax
" Plugin 'othree/html5.vim'

" provides insert mode auto-completion for quotes, parens, brackets, etc
Plugin 'Raimondi/delimitMate'

" Pencil color scheme
" Plugin 'reedes/vim-colors-pencil'

" Extended f, F, t and T key mappings for Vim
Plugin 'rhysd/clever-f.vim'

" Vim plugin for the_silver_searcher, 'ag'
Plugin 'rking/ag.vim'

" Comment/uncomment
Plugin 'tpope/vim-commentary'

" Vim sugar for the UNIX shell commands that need it the most
Plugin 'tpope/vim-eunuch'

" Vim Markdown runtime files
Plugin 'tpope/vim-markdown'

Plugin 'vim-perl/vim-perl'

" Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'vim-scripts/gnuplot.vim'
Plugin 'altercation/vim-colors-solarized'

" Plugin 'vim-scripts/indenthtml.vim'

Plugin 'vim-scripts/vim-javascript'
Plugin 'vim-scripts/mru.vim'
Plugin 'vim-scripts/SAS-Indent'
Plugin 'vim-scripts/SAS-Syntax'
Plugin 'vim-scripts/unicode.vim'

call vundle#end()

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_theme='sol'

let g:tagbar_expand = 1
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
nnoremap <silent> <F8> :TagbarToggle<CR>

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

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

syntax enable
set background=light
colorscheme solarized

filetype plugin on
filetype indent on

let MRU_num = 9

let xml_tag_completion_map = "<C-l>"
let xml_use_html = 1
let psc_statement_different_from_type = 1

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let indent_guides_enable_on_vim_startup=1

let g:ocp_indent_vimfile = system("opam config var share")
let g:ocp_indent_vimfile = substitute(g:ocp_indent_vimfile, '[\r\n]*$', '', '')
let g:ocp_indent_vimfile = g:ocp_indent_vimfile . "/vim/syntax/ocp-indent.vim"

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

    autocmd FileType ocaml exec ":source " . g:ocp_indent_vimfile

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
set clipboard=unnamed
set cmdheight=2
set backspace=indent,eol,start
set confirm
set nodigraph
set directory=~/tmp
set encoding=utf-8
set expandtab
set fileencodings=''
set formatoptions+=n
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
set synmaxcol=200
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
dig \C 199  " Ç
dig \c 231  " ç
dig \g 287  " ğ
dig \G 286  " Ğ
dig \I 304  " İ
dig \i 305  " ı
dig \O 214  " Ö
dig \o 246  " ö
dig \S 350  " Ş
dig \s 351  " ş
dig \U 220  " Ü
dig \u 252  " ü

