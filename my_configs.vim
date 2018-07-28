""""""""""""""my configs"""""""""""""""""
set number
" 设置默认进行大小写不敏感查找
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase
" 鼠标模式可用
set mouse=a
" 共享粘贴板
set clipboard=unnamed
" 当前行高亮
"set cursorline
" 设置粘贴模式快捷键
set pastetoggle=<F9>
" 删除行末空格
nmap <leader><Space> :%s/\s\+$//<cr>
" emacs风格 插入模式使
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
" inoremap <M-f> <S-Right>
" inoremap <M-b> <S-Left>
" code style， tab用空格代替
set ts=4
set expandtab
" 空格键+数字 跳转tab页
nnoremap <silent> <leader>1 1gt
nnoremap <silent> <leader>2 2gt
nnoremap <silent> <leader>3 3gt
nnoremap <silent> <leader>4 4gt
nnoremap <silent> <leader>5 5gt
nnoremap <silent> <leader>6 6gt
nnoremap <silent> <leader>7 7gt
nnoremap <silent> <leader>8 8gt
nnoremap <silent> <leader>9 9gt


""""""""""""""end configs"""""""""""""""""


" *********************************************
"  " CTAGS插件属性
   " git clone git@github.com:majutsushi/tagbar.git
" *********************************************
" 启动时自动focus
let g:tagbar_auto_faocus =1
let g:tagbar_width=35
let g:tagbar_autofocus=1
" 启动指定文件时自动开启tagbar
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
nmap <F2> :TagbarToggle<CR>


" *********************************************
"  " NERD插件属性
"  " Open a NERDTree
" ********************************************
nmap <F3> :NERDTreeToggle<cr>
let NERDTreeWinPos ="left"

" *********************************************
"  " 高亮多词插件
"  " git clone git@github.com:lfv89/vim-interestingwords.git
"  " *********************************************
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>


" *********************************************
"  " vim-go插件属性
"  " ********************************************
" 去掉vim版本低的警告
let g:go_version_warning = 0
" 语法高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" *********************************************
"  " syntastic插件属性
"  " ********************************************
"  打开文件时不自动进行检查
let g:syntastic_check_on_open = 0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'


" *********************************************
" " YCM插件相关
"  " *********************************************
set completeopt=longest,menu  "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif   "离开插入模式后自动关闭预览窗口
" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
let g:ycm_global_ycm_extra_conf = '~/.vim_runtime/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
" let g:ycm_key_invoke_completion = '<M-;>
" 关闭语法错误检测提示
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_error_symbol='>>'
" let g:ycm_warning_symbol='>*'
" 跳转到定义处
" 往前跳和往后跳的快捷键为Ctrl+O以及Ctrl+I
map <leader>j :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jj :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jk :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 默认tab、s-tab和自动补全冲突
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'


" *********************************************
"  " YCM .conf插件属性
" ********************************************
nmap <F4> :YcmGenerateConfig<cr>
if filereadable("./.ycm_extra_conf.py")
    echo "./.ycm_extra_conf.py"
    let g:ycm_global_ycm_extra_conf = './.ycm_extra_conf.py'
endif


" *********************************************
" " autocmd 自动加入文件头
" *********************************************
autocmd BufNewFile *.py,*.sh,*.c,*.cc,*.h,*.go, exec ":call SetMyTitle123()"
let $author_name = "wuzhenzhong"
let $author_email = "jt26wzz@icloud.com"

func SetMyTitle123()
if &filetype == 'sh'
call setline(1,"\##############################################################")
call append(line("."), "\# File Name: ".expand("%"))
call append(line(".")+1, "\# Author: ".$author_name)
call append(line(".")+2, "\# mail: ".$author_email)
call append(line(".")+3, "\# Created Time: ".strftime("%c"))
call append(line(".")+4, "\#=============================================================")
call append(line(".")+5, "\#!/bin/bash")
call append(line(".")+6, "")
elseif &filetype == 'python'
call setline(1,"\# -*- coding: utf-8 -*-")
call setline(1,"\###############################################################")
call append(line("."), "\# File Name: ".expand("%"))
call append(line(".")+1, "\# Author: ".$author_name)
call append(line(".")+2, "\# mail: ".$author_email)
call append(line(".")+3, "\# Created Time: ".strftime("%c"))
call append(line(".")+4, "\#=============================================================")
call append(line(".")+5, "\#!/usr/bin/python")
call append(line(".")+6, "")
elseif &filetype == 'conf'
call setline(1,"\###############################################################")
call append(line("."), "\# File Name: ".expand("%"))
call append(line(".")+1, "\# Author: ".$author_name)
call append(line(".")+2, "\# mail: ".$author_email)
call append(line(".")+3, "\# Created Time: ".strftime("%c"))
call append(line(".")+4, "\#=============================================================")
call append(line(".")+5, "\#=0=!")
call append(line(".")+6, "")
else
call setline(1,"/*\###############################################################")
call append(line("."), "\# File Name: ".expand("%"))
call append(line(".")+1, "\# Author: ".$author_name)
call append(line(".")+2, "\# mail: ".$author_email)
call append(line(".")+3, "\# Created Time: ".strftime("%c"))
call append(line(".")+4, "\#=============================================================")
call append(line(".")+5, "\#La la la!")
call append(line(".")+6, "\*/")
endif
endfunc


" *********************************************
" " nginx.vim
" *********************************************
" 针对conf和rtmp后缀的配置文件，加上nginx语法高亮
autocmd BufNewFile,BufRead *.conf set syntax=nginx
autocmd BufNewFile,BufRead *.rtmp set syntax=nginx


" *********************************************
" " vim-multiple-cursors
" *********************************************
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-a>'
let g:multi_cursor_select_all_word_key = '<C-m>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-h>'
let g:multi_cursor_prev_key            = '<C-l>'
let g:multi_cursor_skip_key            = '<C-q>'
let g:multi_cursor_quit_key            = '<Esc>'


" *********************************************
" " gruvbox
" *********************************************
colorscheme gruvbox
set background=dark    " Setting dark mode


" *********************************************
" " vim-hybrid
" *********************************************
" colorscheme hybrid
" set background=dark    " Setting dark mode


" *********************************************
" " vim-cpp-enhanced-highlight
" *********************************************
" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1
" let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_experimental_template_highlight = 1
" let g:cpp_concepts_highlight = 1
" let g:cpp_no_function_highlight = 1


" *********************************************
" " vim-one
" *********************************************
" let g:airline_theme='one'
" colorscheme one
" set background=dark
" let g:one_allow_italics = 1
" nnoremap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<cr>
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
  " if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  " if (has("termguicolors"))
    " set termguicolors
  " endif
" endif
