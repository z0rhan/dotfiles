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
tnoremap <C-;> <C-\><C-n>

" colorscheme
nnoremap <leader>cs :call ToggleColorscheme()<CR>

let g:current_colorscheme = "gruvbox"
let g:is_transparent = 1

function! ToggleColorscheme()
    if g:current_colorscheme ==# "gruvbox"

        set background=dark
        colorscheme catppuccin_mocha
        let g:current_colorscheme = "catppuccin"
    else
        set background=dark
        colorscheme gruvbox
        let g:current_colorscheme = "gruvbox"
    endif

    if g:is_transparent
        hi Normal guibg=NONE ctermbg=NONE
    else
        hi Normal guibg=#000001 ctermbg=NONE
    endif
endfunction

" Transparent bg
nnoremap <leader>bg :call ToggelBg()<CR>

function! ToggelBg()
    if g:is_transparent
        hi Normal guibg=#000001 ctermbg=NONE
        let g:is_transparent = 0
    else
        hi Normal guibg=NONE ctermbg=NONE
        let g:is_transparent = 1
    endif
endfunction
