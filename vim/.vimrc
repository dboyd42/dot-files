"        _
" __   _(_)_ __ ___  _ __ ____
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sources
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIM/abbrev/abbreviations.vim
source $VIM/src/au.vim
source $VIM/src/mappings.vim
source $VIM/src/playground.vim
source $VIM/src/plugins.vim
source $VIM/src/settings.vim
source $VIMRUNTIME/menu.vim

" OS Restrictions
""""""""""""""""""""""""""""""""""""""""
if has("win64")
    source $VIM/src/win10.vim
"elseif has("unix")
    " do linux/unix things here
endif

" Templates
""""""""""""""""""""""""""""""""""""""""
function! LoadTemplate(extension)
    silent! :execute '0r $VIM/templates/'. a:extension. '.tpl'
    silent! execute 'source $VIM/templates/'.a:extension.'.patterns.tpl'
endfunction
autocmd BufNewFile * silent! call LoadTemplate('%:e')
