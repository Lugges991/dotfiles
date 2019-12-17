if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vifm/neovim-vifm'
Plug 'Valloric/YouCompleteMe'
Plug 'dylanaraps/wal.vim'
Plug 'tell-k/vim-autopep8'
Plug 'https://github.com/chrisbra/csv.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'vimlab/split-term.vim'
Plug 'vim-syntastic/syntastic'
Plug 'chrisbra/Colorizer'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'maksimr/vim-jsbeautify'
Plug 'dense-analysis/ale'

call plug#end()
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

syntax enable

" more natural splitting
set splitbelow
set splitright

" autostarts
"au vimenter * :10Term 
au vimenter * NERDTree
au vimenter * :winc l
set nu

set relativenumber

set clipboard+=unnamedplus

let g:airline_powerline_fonts = 1
set t_Co=256
set scrolloff=15

let g:vimtex_compiler_progname = 'nvr'

" Set to auto read when a file is changed from the outside
set autoread

" Define local leader
let maplocalleader = "-"

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

"fast tab switching
nmap <leader>n :tabn<cr>
nmap <leader>j :tabp<cr>

nmap <leader>t :10Term<cr>

" Fast saving
nmap <leader>w :w!<cr>
" fast quit
nmap <leader>q :wqa<cr>
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


" Tab completion
imap <Tab> <C-P>

" set vimtex pdf viewer
let g:vimtex_view_general_viewer = 'zathura'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 



set ruler
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" activate wildmenu
set wildmenu

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

nnoremap <leader>r <C-w>=

map <space> /
map <c-space> ?


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""
"   fixing the clipboard     "
""""""""""""""""""""""""""""""
map <^> :w !xclip<CR><CR>
vmap <^> "*y
map <S-^> :r!xclip -o<CR>

try
catch
endtry 


""""""""""""""""""""""""""""""
" auto run                   "
""""""""""""""""""""""""""""""

autocmd FileType rust nnoremap <leader><Enter> :! cargo run<cr>
autocmd FileType rust nnoremap <F5> :! cargo run<cr>

autocmd FileType py nnoremap <leader><Enter> :! python3 %<cr>
autocmd FileType py nnoremap <F5> :! python3 %<cr>

"""""""""""""""""""""""""""""
" Autoformatting            "
"""""""""""""""""""""""""""""
au FileType rust nnoremap <leader>f :RustFmt<cr>:w<cr>
au FileType py nnoremap <leader>f :Autopep8<cr>:q<cr>:w<cr>

""""""""""""""""""""""""""""""
" Python shortcuts           "
""""""""""""""""""""""""""""""
autocmd FileType rust inoremap <pr println!(" 


""""""""""""""""""""""""""""""
" java shortcuts             "
""""""""""""""""""""""""""""""
autocmd FileType java  inoremap <p System.out.println();


""""""""""""""""""""""""""""""
" Python shortcuts           "
""""""""""""""""""""""""""""""
autocmd FileType py inoremap <c def class :
autocmd FileType py inoremap <if if():
autocmd FileType py inoremap <fu def ():
autocmd FileType py inoremap <f for :
autocmd FileType py inoremap <main if __name__ == '__main__':<Enter>    

""""""""""""""""""""""""""""""
" LaTeX shortcuts            "
""""""""""""""""""""""""""""""
autocmd FileType tex inoremap <it \textit{}<Esc>T{i
autocmd FileType tex inoremap <fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><Enter><Enter>\end{frame}<Enter><Enter><Esc>6kf}i
autocmd FileType tex inoremap <bf \textbf{}<Esc>T{i
autocmd FileType tex inoremap <ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><Esc>3kA\item<Space>
autocmd FileType tex inoremap <il \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><Esc>3kA\item<Space>
autocmd FileType tex inoremap <fi \begin{figure}<Enter><Enter>\end{figure}<Enter><Enter><Esc>3kA\includegraphics<Space>
autocmd FileType tex inoremap <li <Enter>\item<Space>
autocmd FileType tex inoremap <ref \ref{}<Space><Esc>T{i
autocmd FileType tex inoremap <tab \begin{tabular}<Enter><Enter>\end{tabular}<Enter><Enter><Esc>4kA{}<Esc>i
 autocmd FileType tex inoremap <a \href{}{}<Space><Esc>2T{i
autocmd FileType tex inoremap <sec \section{}<Enter><Enter><Esc>2kf}i
autocmd FileType tex inoremap <ssec \subsection{}<Enter><Enter><Esc>2kf}i
autocmd FileType tex inoremap <sssec \subsubsection{} 2kf}i
autocmd FileType tex inoremap <nl \newline<Enter>
autocmd FileType tex inoremap <ref \textit{[ref]}
