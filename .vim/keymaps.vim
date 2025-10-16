let mapleader = " "
nmap <leader>v :Ex<CR>

" fuzzy finding
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :Rg<CR>

" buffers
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bk :call CloseBuffer()<CR>

function! CloseBuffer()
    if &buftype ==# 'terminal'
        execute 'bwipeout!'
    else
        execute 'bwipeout'
    endif
endfunction

" copy to clipboard
vnoremap <leader>y "+y
vnoremap <C-x> "+d
vnoremap <C-x> "+d

" tab-related
nnoremap <C-t> :tabnew<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>

" undo-tree
nnoremap <leader>ut :UndotreeToggle<CR>

" terminal
nnoremap <leader>ot :botright terminal<CR>
tnoremap <C-[> <C-\><C-n>
