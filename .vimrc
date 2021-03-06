"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.cache/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

" Add or remove your plugins here:
call dein#add('nanotech/jellybeans.vim')            "カラースキームをjellybeansに設定
call dein#add('scrooloose/syntastic')               "シンタックスチェック
call dein#add('Shougo/neocomplete.vim')             "キーワード補完
call dein#add('Shougo/neosnippet.vim')              "スニペットプラグイン本体
call dein#add('Shougo/neosnippet-snippets')         "スニペット定義 netsnippetと合わせて使う
call dein#add('Shougo/unite.vim')                   "統合インタフェース
call dein#add('Shougo/vimfiler')                    "ファイルエクスプローラ
call dein#add('tpope/vim-fugitive' )                "Gitのラッパー
call dein#add('fatih/vim-go' )                      "Go言語

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" vim-fugitive
"" ステータス行にgitのbranchを表示する
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P 

" vimfiler
"" 標準のエクスプローラに設定する (コマンドモード時に :e .)
let g:vimfiler_as_default_explorer = 1
"" IDEのファイルエクスプローラ形式で表示させる (F1)
nnoremap <F1> :VimFiler -buffer-name=explorer -split -winwidth=50 -toggle -no-quit<Cr>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
" 
let g:syntastic_auto_loc_list = 1
"" file open時にチェックをする
let g:syntastic_check_on_open = 1
"" :wq時にチェックをしない
let g:syntastic_check_on_wq = 0
"" shell script
let g:syntastic_sh_checkers = ['shellcheck']
"" Go
let g:syntastic_go_checkers = ['golint', 'gotype', 'govet', 'go']

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '*ku*'
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
noremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" jellybeans.vim
"" カラースキームをjellybeansに設定する
colorscheme jellybeans
"" 背景色が暗い時用の設定をする
set background=dark
"" 256色表示設定
set t_Co=256

" vim-go
let g:go_fmt_command = "gofmt"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_term_enabled = 1
let g:go_highlight_build_constraints = 1

augroup GolangSettings
  autocmd!
  autocmd FileType go nmap <leader>gb <Plug>(go-build)
  autocmd FileType go nmap <leader>gt <Plug>(go-test)
  autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
  autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err\>/
augroup END

" 共通設定
"" 構文ハイライトを有効にする
syntax enable
"" 検索時に大文字小文字を区別しない
set ignorecase
"" 検索時に大文字が入った場合は大文字小文字を区別する
set smartcase
"" インクリメンタル検索（最初の文字を入力した時点で検索）を有効にする
set incsearch
"" 検索結果をハイライトにする
set hlsearch
"" 検索時に/を自動でエスケープする
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
"" 検索時に?を自動でエスケープする
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
"" 書き込み前にバックアップを作成しない
set nowritebackup
"" swapファイルを作成しない
set noswapfile
"" ~のついたバックアップファイルを作成しない
set nobackup
"" visualモードで選択した箇所を他アプリケーションでコピペできるようにする
set clipboard+=autoselect
"" yankした箇所を他アプリケーションでコピペできるようにする
set clipboard+=unnamed
"" 末尾から2行目にステータスラインを表示させる
set laststatus=2
"" 行番号を表示する
set number
"" ウインドウ幅より長い行はを折り返して表示する
set wrap
"" テキスト幅の最大幅を無効にし無制限に設定する
set textwidth=0
"" エラー時のビープ音を無効にする
set t_vb=
"" エラー時の画面フラッシュを無効にする
set novisualbell
"" Tab,EOLなどの不可視文字を可視化する
set list
"" 可視化で使用する文字・記号を設定
set listchars=eol:¬,trail:-,nbsp:%,tab:▸\ 
"" tab文字の幅
set tabstop=2
"" 連続した空白に対してtab押下時に動く幅
set softtabstop=2
