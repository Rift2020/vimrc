"启用插件
set nocompatible 
filetype plugin on

set number 
set tabstop=4
set shiftwidth=4
set autoindent
set cindent
set laststatus=2
set completeopt=""
set mouse=a
set backspace=2
set softtabstop=4
syntax on

"插件
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mzlogin/vim-markdown-toc'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

"vim-markdown set
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1

"ale set
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''


"键位映射
"F2调用文件树插件
map <F2> :NERDTreeToggle<CR>
"ctrl+a直接全选复制到系统剪切板 
map <C-a> ggvG$"+y
map <F12> :MarkdownPreview<CR>
"F9编译并运行
nnoremap <F9> :call CompileRunGcc()<CR>


"将当前文件<filename>.cpp 
"以c++17标准编译，输出重定向到 <filename>output文件中
"待程序结束后，在末尾打印所有的程序输出
"并且删除所有的中间文件(<filename>,<filename>output)
func! CompileRunGcc()
	:w
	exec "wall"
	exec '!g++ % -o %< -std=c++17 -D LOCAL;./%< >%<output;echo -e "\033[34moutput is:\033[0m";cat %<output;rm %<output %<'

endfunc

"在创建一个新cpp文件时，自动加上作者，创建时间，和代码模板
autocmd BufNewFile *.cpp exec ":call SetTitle()"

func SetComment()
	call setline(1,"/**")
	call setline(2," *    author:  Rift")
	call setline(3," *    created: ".strftime("20%y.%m.%d  %H:%M"))
	call setline(4,"**/")
endfunc

func SetTitle()
	call SetComment()
	call setline(5,"#include<bits/stdc++.h>")
	call setline(6,"#define rep(i, a, b) for (int i = (a); i <= (b); ++i)")
	call setline(7,"#define per(i, a, b) for (int i = (a); i >= (b); --i)")
	call setline(8,"#define x first")
	call setline(9,"#define y second")
	call setline(10,"using namespace std;")
	call setline(11,"using ll = long long;")
	call setline(12,"using pr = pair<int,int>;")
	call setline(13,"")
	call setline(14,"signed main(){")
	call setline(15,"	ios::sync_with_stdio(false),cin.tie(nullptr);")
	call setline(16,"	")
	call setline(17,"	")
	call setline(18,"	")
	call setline(19,"	return 0;")
	call setline(20,"}")
	call cursor(13,1)
endfunc
