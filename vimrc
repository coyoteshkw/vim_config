" cursor
" > https://stackoverflow.com/questions/6488683/how-to-change-the-cursor-between-normal-and-insert-modes-in-vim
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" 修复按下Esc后光标恢复有延迟的问题
set ttimeout
set ttimeoutlen=1
set ttyfast
set termguicolors " 24位真彩色(比256色还大)
set laststatus=2
" 高亮当前行
" set cursorline
" highlight CursorLine cterm=NONE ctermbg=darkgray guibg=lightgrey
" 另一种方法
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ==================== basic settings ==================== 
" ==================== basic settings ==================== 
" ==================== basic settings ==================== 
" https://web.archive.org/web/20090213130939/http://items.sjbach.com/319/configuring-vim-right

syntax on
set mouse=a
set hidden
set number
set nobackup
set encoding=utf-8
set hlsearch
filetype plugin indent on
set autoindent
set shiftwidth=4
set backspace=2
set tabstop=4
set wildmenu
set wildmode=list:longest,full
set ignorecase
set smartcase
set title
set scrolloff=3
set ruler
" Highlight search terms...
set hlsearch
set incsearch " dynamically as they are typed.
set belloff=all " so annoying


" ==================== keyboard mapping ==================== 
" ==================== keyboard mapping ==================== 
" ==================== keyboard mapping ==================== 

" 快速退出插入模式
inoremap jk <esc>
" <c-c>可以在命令行和可视模式下进入normal模式
" vnoremap jk <esc>
" cnoremap kj <C-C>

" 快速移动
noremap J 5j
noremap K 5k
" noremap gj G

" set leader key
let mapleader=" "

" 保存退出快捷键
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
" nnoremap <leader>r so %<cr>
" 重映射分号，避免重复输入冒号到手痛
noremap ; :
" noremap ' :

" 求你别一直高亮了
nmap <silent> <leader>n :silent :nohlsearch<CR>

" === 窗口 ===
" c-w q 可以关系当前窗口 c-w o 关闭除当前窗口外的所有窗口
tnoremap <c-j> <c-w><c-j>
tnoremap <c-k> <c-w><c-k>
tnoremap <c-l> <c-w><c-l>
tnoremap <c-h> <c-w><c-h>

" 在tmux下无效
inoremap <C-Enter> <Esc>o


" ==================== plugins ==================== 
" ==================== plugins ==================== 
" ==================== plugins ==================== 

" packloadall " 加载所有插件
" silent! helptags ALL "为所有插件加载帮助文档

" ==> vim-plug

call plug#begin()
Plug 'junegunn/vim-plug' " 加载文档
Plug 'tpope/vim-vinegar' " 给newtr目录管理添加- 键等小功能，如果安装Nerdtree会默认使用那个
Plug 'ctrlpvim/ctrlp.vim' " 搜索当前目录的文件、最近修改的文件、buffer
Plug 'mileszs/ack.vim' " 在vim中使用ack命令，将结果用quickfix窗口打开
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround' " 添加、修改各种括号中的内容
Plug 'tpope/vim-unimpaired' " 为[ ] y 键添加一些实用映射
Plug 'rhysd/clever-f.vim' " 重复f/F键来执行原先;,的操作
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify' " 美化启动界面
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 语法补全
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary' " 注释 gcc

" ==> colorscheme
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'junegunn/seoul256.vim'
call plug#end()

" ==> colorscheme

" set background=dark "light
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
" seoul256 config info:https://github.com/junegunn/seoul256.vim

" hi Normal guibg=NONE ctermbg=NONE
" let t:is_transparent = 0
" Toggle transparent background
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
"        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap gl : call Toggle_transparent()<CR>

" ==> ctrlp
let g:ctrlp_show_hidden = 0 " ctrl插件允许搜索隐藏文件

" ==> clever-f
let g:clever_f_chars_match_any_signs = ";"
let g:clever_f_smart_case = 1

" ==> vim-airline 
" let g:airline_theme='bubblegum'
let g:airline_theme = 'catppuccin'
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = '❮'
let g:airline_powerline_fonts = 1 " 使用nerdfont字符

" ==> coc.nvim
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> gk :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('gk', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
"nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>gf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
