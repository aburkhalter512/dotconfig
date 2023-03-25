let g:loaded = 1

lua require('plugins')

let mapleader = " "
noremap <Space> <Nop>

" PlugInstall
" PlugUpdate

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
"
let g:ale_fixers = {
 \ 'javascript': ['prettier', 'eslint'],
 \ 'typescript': ['prettier', 'eslint'],
 \ 'rust': ['rustfmt'],
 \ }

let g:ale_fix_on_save = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1

lua require('langs')
lua require('editor')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 0
set grepprg=rg\ --color=never\ --hidden
let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
let g:ctrlp_use_caching = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dispatch
"
let g:dispatch_tmux_height = 80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC
"

" Jump to Definition
nmap <silent> <leader>de :call CocActionAsync('jumpDefinition', 'edit')<CR>
nmap <silent> <leader>dv :call CocActionAsync('jumpDefinition', 'vsplit')<CR>
nmap <silent> <leader>ds :call CocActionAsync('jumpDefinition', 'split')<CR>
nmap <silent> <leader>dt :call CocActionAsync('jumpDefinition', 'tabe')<CR>

" Jump to Type
nmap <silent> <leader>te :call CocActionAsync('jumpTypeDefinition', 'edit')<CR>
nmap <silent> <leader>tv :call CocActionAsync('jumpTypeDefinition', 'vsplit')<CR>
nmap <silent> <leader>ts :call CocActionAsync('jumpTypeDefinition', 'split')<CR>
nmap <silent> <leader>tt :call CocActionAsync('jumpTypeDefinition', 'tabe')<CR>

" Jump to Implementation
nmap <silent> <leader>i :call CocActionAsync('jumpImplementation', 'edit')<CR>

" Code Actions
nmap <silent> <leader>ac <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>as <Plug>(coc-codeaction-selected)
nmap <silent> <leader>af <Plug>(coc-codeaction)

" Rust Expand Macro
nmap <leader>rex :call coc#rpc#notify('runCommand', ['rust-analyzer.expandMacro'])<CR>

" Rename
nmap <leader>rn <Plug>(coc-rename)

" Show References
nmap <silent> <leader>ref <Plug>(coc-references)

" Hover
nmap <silent> <leader>h :call CocActionAsync('doHover')<CR>

" Autocompletion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

