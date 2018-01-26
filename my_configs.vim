""""""""""""""my configs"""""""""""""""""
set number
" 设置默认进行大小写不敏感查找
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase
" 鼠标模式可用
set mouse＝a
" emacs风格 插入模式使
inoremap <C-e> <END> 
inoremap <C-a> <HOME> 
inoremap <C-f> <Right> 
inoremap <C-b> <Left> 
inoremap <M-f> <S-Right> 
inoremap <M-b> <S-Left> 
inoremap <M-n> <Down> 
inoremap <M-p> <Up> 


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
 "  " ********************************************
 "  " Open a NERDTree
 nmap <F1> :NERDTreeToggle<cr>

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
 "  去掉vim版本低的警告
 let g:go_version_warning = 0
