set nocompatible
filetype plugin on
set number
set noshowmode
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


"Plugin List
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
call plug#end()

"ycm set
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  {
             \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
             \ 'cs,lua,javascript': ['re!\w{2}'],
             \ }
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1,
			\ "sh":1,
			\ }
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=DeepSkyBlue4
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=DeepSkyBlue4 guibg=black
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


"key map
map <F10> :NERDTreeToggle<CR>
map <C-a> ggvG$
"only on OSX
"vmap <C-c> y:w !pbcopy<CR><CR>

"only on wsl
"vmap <C-c> :'<,'>w !/mnt/c/Windows/System32/clip.exe<CR><CR>

nnoremap <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "wall"
exec '!g++ % -o %< -std=c++17 -D LOCAL'
exec '!time ./%<'
endfunc
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
	call setline(8,"#ifdef LOCAL")
	call setline(9,"");
    call setline(10,"");
    
    "only on Linux(green output)
    "call setline(9,"#define cout cout<<\"\\033[32m\"")
	"call setline(10,"#define endl \"\\033[0m\"<<endl")
	
    call setline(11,"#endif")
	call setline(12,"using namespace std;")
	call setline(13,"using ll = long long;")
	call setline(14,"")
	call setline(15,"signed main(){")
	call setline(16,"	ios::sync_with_stdio(false);")
	call setline(17,"	cin.tie(nullptr);")
	call setline(18,"")
	call setline(19,"")
	call setline(20,"")
	call setline(21,"	return 0;")
	call setline(22,"}")
	call cursor(12,1)	
endfunc

