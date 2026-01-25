" Completion shit
set completeopt=menuone,noinsert,noselect
highlight Pmenu ctermbg=NONE guibg=#1e1e1e
highlight PmenuSel ctermbg=NONE guibg=#333333

set shortmess+=c

let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_completeopt = 0

" Lsp shit
let g:lsp_diagnostics_enabled = 0
if executable('clangd')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
		\ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc', 'cuda'],
        \ })
endif

if executable('/home/z0rhan/.local/share/nvim/mason/bin/glsl_analyzer')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'glsl_analyzer',
        \ 'cmd': {server_info->['/home/z0rhan/.local/share/nvim/mason/bin/glsl_analyzer']},
		\ 'allowlist': ['gdshader'],
        \ })
endif

if executable('rust-analyzer')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif

if executable('/home/z0rhan/.local/share/nvim/mason/bin/pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['/home/z0rhan/.local/share/nvim/mason/bin/pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
