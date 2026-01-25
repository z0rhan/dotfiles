" Source : https://www.tonybtw.com/tutorial/vim/

let s:plugin_dir = expand('~/.vim/plugged')

function! s:ensure(repo)
    let name = split(a:repo, '/')[-1]
    let path = s:plugin_dir . '/' . name

    if !isdirectory(path)
        if !isdirectory(s:plugin_dir)
            call mkdir(s:plugin_dir, 'p')
        endif
        execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
    endif

    execute 'set runtimepath+=' . fnameescape(path)
endfunction

" Plugins
call s:ensure('morhetz/gruvbox')
call s:ensure('junegunn/fzf')
call s:ensure('junegunn/fzf.vim')
call s:ensure('itchyny/lightline.vim')
call s:ensure('christoomey/vim-tmux-navigator')
call s:ensure('mbbill/undotree')
call s:ensure('jiangmiao/auto-pairs')
call s:ensure('catppuccin/vim')
call s:ensure('prabirshrestha/vim-lsp')
call s:ensure('prabirshrestha/asyncomplete.vim')
call s:ensure('prabirshrestha/asyncomplete-lsp.vim')
