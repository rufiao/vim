
" basic options ----------------------------------------------------------- {{{

" patch the color scheme after it's loaded
augroup patchcolorscheme
  autocmd ColorScheme * highlight VertSplit guifg=#2e3330 guibg=#2e3330
augroup END

" set color scheme
colorscheme zenburn
let g:zenburn_old_Visual = 1

set showmode! " disable showmode, as powerline shows it

" }}}

" laguages ---------------------------------------------------------------- {{{

" lisp rainbow parens
let g:lisp_rainbow=1

" slimv repl syntax coloring
let g:slimv_repl_syntax = 1

" open repl in a vertical split on the right
let g:slimv_repl_split = 4

" }}}

" commands ---------------------------------------------------------------- {{{

":V edits vimrc
:command! V exe "e ~/.vim/vimrc"

":VD edits defaults.vim
:command! VD exe "e ~/.vim/defaults.vim"

":VC edits custom.vim
:command! VC exe "e ~/.vim/custom.vim"

":VV reloads .vimrc
:command! VV exe "w | mkview | source ~/.vimrc | filetype detect | echo 'vimrc reloaded'"

" :C opens !/.vim/cheasheet.txt
:command! C exe "e ~/.vim/cheasheet.txt"

" :H shows hidden characters
:command! H exe ":set list!"

" :Q closes all buffers
:command! Q exe ":bufdo bdelete"

" :T converts all buffers into tabs
:command! T exe ":tab sball"

" :Z strips all trailing whitespace in the current file
:command! Z exe ":%s/\s\+$// | :let @/=''"

" :S to turn on/off spell checker
:command! S exe ":set spell!"

" :U turns on/off gundo
:command! U exe ":GundoToggle"

" }}}

" plugin options ---------------------------------------------------------- {{{

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" fuzzyfinder datadir
let g:fuf_dataDir="~/.vim/tmp/fuf"

" powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2

" use newer ctags from homebrew
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"

" NERDTree
let NERDChristmasTree=1
let NERDTreeMouseMode=3
let NERDTreeBookmarksFile=$HOME.'/vim/tmp/NERDTreeBookmarks'
let NERDTreeShowHidden=1
let NERDTreeDirArrows=1

" Ctrl-P
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/tmp/ctrlp'

" nerdcommenter
let g:NERDCreateDefaultMappings = 0

" buftabs
:let g:buftabs_only_basename=1

" easytags
" let g:easytags_cmd = '/usr/local/bin/ctags'
" let g:easytags_file = '~/.vim/tmp/easytags/all'
" let g:easytags_by_filetype = '~/.vim/tmp/easytags/'
" set tags=./tags;
" let g:easytags_dynamic_files = 1

" neocomplcache
" disable AutoComplPop.
let g:acp_enableAtStartup = 0
" use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" use smartcase.
let g:neocomplcache_enable_smart_case = 1
" use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" key-mappings.
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" }}}

" plugin mappings --------------------------------------------------------- {{{

" peepopen
map <leader><space> :PeepOpen<cr><cr>

" ,t opens ctrlp
let g:ctrlp_map = '<leader>t'
nnoremap <leader>l :CtrlPBuffer<cr>

" ,a opens ACK
nnoremap <leader>a :Ack<space>

" ,g opens Grep
nnoremap <leader>g :Grep<space>

" ,y toggles nerdtree
nnoremap <leader>y :NERDTreeToggle<cr>

" \\ toggles comments
nnoremap \\ :call NERDComment("n", "toggle")<CR>
vnoremap \\ :call NERDComment("n", "toggle")<CR>gv

" Waldo
if ! exists("g:waldo_loaded")
  let g:waldo_loaded = 1
  let s:save_cpo = &cpo
  set cpo&vim
  function s:LaunchWaldoViaVim()
    let cwd = getcwd()
    silent exe  "!open -a Waldo " . shellescape(cwd)
    silent exe  "!open -a Waldo " . shellescape(cwd)
  endfunction
  command! Waldo :call <SID>LaunchWaldoViaVim()
  noremap <unique> <script> <Plug>Waldo <SID>Launch
  noremap <SID>Launch :call <SID>LaunchWaldoViaVim()<CR>
  if !hasmapto('<Plug>Waldo')
    map <unique> <silent> <Leader>f <Plug>Waldo
  endif
endif

" }}}

