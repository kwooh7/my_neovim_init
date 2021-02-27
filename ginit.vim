if exists('g:GuiLoaded')
    GuiTabline 0
    Guifont! Hack\ NF:h12
    GuiLinespace 2
    GuiPopupmenu 0
endif

if exists('g:neovide')
    "let g:neovide_fullscreen=v:true
    let g:neovide_cursor_animation_length=0.23
    let g:neovide_cursor_vfx_mode="torpedo"
    set guifont=Cascadia\ Code\ PL:h16
endif

if exists('g:fvim_loaded')
    "nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    "nnoremap <silent> <C-ScrollWheelUp> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
    FVimFontAntialias v:true
    set guifont=Cascadia\ Code\ PL:h16
endif
