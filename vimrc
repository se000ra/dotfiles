" vim: fdm=marker fdc=2 foldlevelstart=0 sts=4 sw=4 tw=64 fileencoding=utf-8:
set nocompatible
filetype off " required
" Vundle
set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()
"Screen совместимость
set t_Co=256
set ttymouse=xterm2
let mapleader = ","
noremap \ ,

" Шпаргалка {{{1
"  
" ---   Folding  ----
" za - Toggle       zA - recursively
" zM - Close all    zR - Open all
" zx - udate all
" 
" Узнать из какого файла переменная была установлена посл. раз
"   :verbose set переменная
" Список всех переменных
"   :let
" Список всех пользовательских функций
"   :function
" Список всех привязок
"   :map
" Показывает значения всех опций, которые отличаются от настроек по умолчанию.
"   :set
"}}}

" Установленные плагины и их зависимости {{{1
"============= "SYSTEM"  =============
Bundle "gmarik/vundle"
Bundle 'unite.vim'
Bundle "http://github.com/Shougo/vimproc.vim.git"
Bundle "ctrlp.vim"
Bundle 'Tagbar'
"============= "VIEW" =============
Bundle "flazz/vim-colorschemes"
"============= "Productivity" =============
Bundle "vimwiki"
Bundle 'http://github.com/teranex/vimwiki-tasks.git'
"============= "Git" =============
Bundle "tpope/vim-fugitive"
Bundle 'airblade/vim-gitgutter'
Bundle 'gitv'
"============= "Python" =============
Bundle "python.vim--Vasiliev"
"Bundle "klen/python-mode"
"Bundle 'ivanov/vim-ipython'
Bundle 'davidhalter/jedi-vim'
"============= "Coding" =============
Bundle 'Gundo'
Bundle "scrooloose/nerdcommenter"
Bundle "Lokaltog/vim-easymotion"
Bundle 'SirVer/ultisnips'
Bundle "http://github.com/Shougo/neocomplete.vim.git"
"Bundle 'Shougo/neosnippet'
"Bundle 'honza/vim-snippets'
Bundle 'Valloric/YouCompleteMe'
Bundle "mattn/emmet-vim"
Bundle "surround.vim"
Bundle "aperezdc/vim-template"
"Bundle "AndrewRadev/inline_edit.vim"
"============= "Syntax" =============
Bundle "https://github.com/PotatoesMaster/i3-vim-syntax.git"
Bundle 'Arduino-syntax-file'
Bundle 'dogrover/vim-pentadactyl'
Bundle 'Vim-R-plugin'
Bundle "http://github.com/bonsaiben/bootstrap-snippets.git"
Bundle "http://github.com/Glench/Vim-Jinja2-Syntax.git"
" end of list plugins }}}

"    VIM setup    {{{
" "Basic"                   Базовые настройки {{{
" ==============================================================================
filetype plugin indent on     " required!
" Включение складок
set foldenable
" Ширина колонки
"set foldcolumn=4
set foldlevelstart=99
set foldmethod=indent
set foldnestmax=3

set textwidth=80
set colorcolumn=81
" Перенос по словам
set linebreak

" Включение подсветки синтаксиса
syntax on

" Отключение оповещения морганием и звуком
set novisualbell

set helplang=en,ru

" Переход на предыдущую/следующую строку
set backspace=indent,eol,start

" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set whichwrap+=<,>,[,]


" Кодировка по умолчанию
set encoding=utf-8
set fileencoding=utf-8

set fileencodings=utf-8,cp1251,cp866,koi8-r

set fileformat=unix          " Формат файла по умолчанию
set fileformats=unix,dos,mac

" Не выгружать буфер, при переключении на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без
" необходимости сохранения каждый раз когда переключаешься между ними
set hidden

set autoread            " Включение автоматического перечтения файла при изменении
set autochdir           " Автоматически устанавливать текущей, директорию отрытого файла
set browsedir=buffer    " Начинать обзор с каталога текущего буфера
set confirm             " Включение диалогов с запросами

" Опции авто-дополнения
set completeopt=longest,menuone


" Включение проверки орфографии, для русского и английского
set spelllang=ru_yo,en_us
"set spell

" Раскладка по умолчанию - английская
set iminsert=0

" Не перерисовывать окно при работе макросов
set lazyredraw

" }}}

" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

" Показывать все возможные кандидаты при авто-завершении команд
"set nowildmenu
"set wildmode=longest,list,full

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats
set wildignore+=*.so,*.swp,*.zip

" }}}
" Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" В режиме поиска используется раскладка, заданная по умолчанию
"set imsearch=-1
" }}}

" History and permanent undo levels {{{

set history=1000
set undofile
set undoreload=1000

" }}}

" Make a dir if no exists {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" "View"                    Вид {{{
" ==============================================================================

set ruler       " Включение отображения позиции курсора (всё время)

set mouse=a     " Подключение мыши
set mousehide   " Прятать указатель во время набора текста
set cursorline  " Включить подсветку текущей позиции курсора
set mousemodel=popup

colorscheme wombat256mod
"colorscheme desert256
"colorscheme tesla

set number          " Включение отображения номеров строк
set shortmess+=I    " Отключение приветственного сообщения
set showtabline=2   " Показывать по умлочанию строку со вкладками
set wildmenu        " Показывать меню в командной строке
                    " для выбора вариантов авто-дополнения
set showmatch       " Довсвечивать совпадающую скобку
runtime macros/matchit.vim "jump between matching keywords
set list            " Подсвечивать некоторые символы

" Установка символов для подсветки
set list listchars=tab:▹·,trail:·,extends:»,precedes:«,nbsp:×
"set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
" }}}

" "Indent"                  Отступы и табуляция {{{
" ==============================================================================

set autoindent                          " Наследовать отступы предыдущей строки
"set smartindent                         " Включить 'умные' отступы
set expandtab                           " Преобразование таба в пробелы
set shiftwidth=4                        " Размер табуляции по умолчанию
set softtabstop=4
set tabstop=4
" }}}

" "Statusline"               Статусная строка {{{
" ==============================================================================

" Включение отображения незавершенных команд в статусной строке
set showcmd

" Всегда отображать статусную строку
set laststatus=2

hi StatusLineBufferNumber guifg=fg guibg=bg gui=bold

" Формат статусной строки
set stl=
set stl+=\ %#StatusLineBufferNumber#
set stl+=[%n]    " Номер буфера
set stl+=%*\
set stl+=%<
set stl+=%f      " Имя файла загруженного в буфер
set stl+=%*\
set stl+=[%{&ft} " Тип файла, загруженного в буфер, например [cpp]
set stl+=\ \|\
set stl+=%{&fileencoding} " Кодировка файла
set stl+=\ %{fugitive#statusline()}\  "статус git
set stl+=\ \|\
set stl+=%{&ff}] " Формат файла
set stl+=%=      " Выравнивание по правому краю
set stl+=\
set stl+=L:
set stl+=\ %l/   " Номер строки
set stl+=%L      " Количество строк в буфере
set stl+=\
set stl+=C:
set stl+=\ %3v   " Номер колонки
set stl+=\
set stl+=[%P]    " Позиция текста, отображаемого в окне
                 " по отношению к началу файла в процентах
set stl+=%#error#%m%*       " Флаг состояния несохранённых изменений
set stl+=%#warningmsg#%r%*  " Флаг состояния 'только для чтения

" Показ нескольких типов предупреждений связанных с некорректной работой с
" отступами:
" "[mixed-indenting]" - В случае если в файле для задания отступов совместно
" используются пробелы и символы табуляции
" "[expandtab-disabled]" - Если опция expandtab отключена, но в файле для
" задания отступов применяются пробелы
" "[expandtab-enabled]" - Если опция expandtab активна, но для задания
" отступов используются символы табуляции
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
" }}}

" "User Shortcuts"          Горячие клавиши {{{
" ==============================================================================

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Autoload configuration when this file changes ($MYVIMRC)
autocmd! BufWritePost vimrc source %

" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! w !sudo tee >/dev/null %
cmap W w !sudo tee % >/dev/null<CR>

" mute search highligting
nnoremap <silent> <space>l :<C-u>nohlsearch<CR><C-l>
"map <silent><Leader>l :set invhlsearch<CR>

"используем ranger как filechooser
map <leader>r :call RangerChooser()<CR>

" Русская расскладка
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" just subsitute ESC with , jk и в рус раскл бб ол не работает
inoremap ii <Esc>
vnoremap ii <Esc>
vnoremap шш <Esc>
inoremap шш <Esc>

"--- "Fast copy" ------{{{
" после unite registers ring и copyQ все это не нужно
"nmap <leader>y "*y "copy to X11 primary
"nmap <leader>Y "yy
"nmap <leader>p "*p " пастим из X11 primary
"}}}
"--- "что висит на функциональных клавишах" ------{{{
" Открытие командной строки помощи (plugin-FuzzyFinder)"
"map <C-F1> :FufHelp<cr>
"vmap <C-F1> <esc>:FufHelp<cr>
"imap <C-F1> <esc>:FufHelp<cr>

" Список тегов (plugin-tagbar)
inoremap <F2> :TagbarToggle<CR>
vnoremap <F2> :TagbarToggle<CR>
nnoremap <F2> :TagbarToggle<CR>


nnoremap <F3> :set invpaste paste?<CR>
nnoremap <F3> :set invpaste paste?<CR>
nnoremap <space>p :set invpaste paste?<CR>
inoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

 "Вставка таймстампа 
noremap <F6> i<C-R>=strftime("%Y-%m-%d %H:%M")<CR>: 
inoremap <F6> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>: 

noremap <F7> i<C-R>=strftime("%Y-%m-%d %H:%M")<CR>: break**<Esc>o
inoremap <F7> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>: break**
" Выполнение/Открытие файла
"nmap <F5> <esc>:call <SID>OpenFileInDefaultApp()<cr>
"vmap <F5> <esc>:call <SID>OpenFileInDefaultApp()<cr>i
"imap <F5> <esc><esc>:call <SID>OpenFileInDefaultApp()<cr>i

" Просмотр списка буферов (plugin-fuzzyfinder)
"map <F6> :FufBuffer<cr>
"vmap <F6> <esc>:FufBuffer<cr>
"imap <F6> <esc>:FufBuffer<cr>


" Список файлов в текущей директории (plugin-fuzzyfinder)
"nmap <F7> <esc>:FufFile<cr>
"vmap <F7> <esc>:FufFile<cr>
"imap <F7> <esc>:FufFile<cr>

"" Навигатор по коду (plugin-sourceExplorer)
"map <C-F8> :SrcExplToggle<cr>
"vmap <C-F8> <esc>:SrcExplToggle<cr>
"imap <C-F8> <esc>:SrcExplToggle<cr>

"" Обновление файла тегов для CodeExplorer (plugin-sourceExplorer)
"map <C-F8> :call g:SrcExpl_UpdateTags()<cr>
"vmap <C-F8> <esc>:call g:SrcExpl_UpdateTags()<cr>i
"imap <C-F8> <esc>:call g:SrcExpl_UpdateTags()<cr>i

" Обозреватель файлов (plugin-NERD_Tree)
"map <F8> :NERDTreeToggle<cr>
"vmap <F8> <esc>:NERDTreeToggle<cr>
"imap <F8> <esc>:NERDTreeToggle<cr>

" Загрузка последней сессии (работает если в
" секции "Сессии" определена команда авто-сохранения)
"if s:us_autosaveses
    "exec 'nmap <F9> <esc>:source ' . s:lastsession_file . '<cr>'
    "exec 'vmap <F9> <esc>:source ' . s:lastsession_file . '<cr>'
    "exec 'imap <F9> <esc>:source ' . s:lastsession_file . '<cr>i'
"endif

" Полноэкранный режим (plugin-vimshell)
"inoremap <F10> <C-o>:Fullscreen<CR>
"nnoremap <F10> :Fullscreen<CR>

" Закрыть окно
"map <F11> :close<cr>
"vmap <F11> <esc>:close<cr>i
"imap <F11> <esc>:close<cr>i

" Удалить буфер
"map <F12> :bdelete<cr>
"vmap <F12> <esc>:bdelete<cr>
"imap <F12> <esc>:bdelete<cr>


"--- "навигация по окнам" --- "{{{
"
" Move the cursor to the window left of the current one
noremap <silent> ,h :wincmd h<cr>

" Move the cursor to the window below the current one
noremap <silent> ,j :wincmd j<cr>

" Move the cursor to the window above the current one
noremap <silent> ,k :wincmd k<cr>

" Move the cursor to the window right of the current one
noremap <silent> ,l :wincmd l<cr>

" Close the window below this one
noremap <silent> ,cj :wincmd j<cr>:close<cr>

" Close the window above this one
noremap <silent> ,ck :wincmd k<cr>:close<cr>

" Close the window to the left of this one
noremap <silent> ,ch :wincmd h<cr>:close<cr>

" Close the window to the right of this one
noremap <silent> ,cl :wincmd l<cr>:close<cr>

" Close the current window
"noremap <silent> ,cc :close<cr>

" Move the current window to the right of the main Vim window
noremap <silent> ,ml <C-W>L

" Move the current window to the top of the main Vim window
noremap <silent> ,mk <C-W>K

" Move the current window to the left of the main Vim window
noremap <silent> ,mh <C-W>H

" Move the current window to the bottom of the main Vim window
noremap <silent> ,mj <C-W>J

" }}}


" =============================================================================="}}}
" "Functions"               Пользовательские функции {{{
" ==============================================================================

let s:cmdline = ""

" Use Ranger as a file explorer {{{

fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
"map <Leader>r :call RangerChooser()<CR>
" }}}


" Toggle line numbers {{{

"nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>

function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

" }}}

" Toggle the Quickfix window {{{

function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()

nnoremap <silent> <Leader>q :ToggleQuickfix<CR>

" }}}
" Открытие файла приложением определённым по умолчанию
function! s:OpenFileInDefaultApp()
    if s:cmdline == ""
        execute '!"%"'
        "execute 'call system(shellescape(expand("<cfile>") ' . s:cmdline . '))'
    else
        execute '!"% ' . s:cmdline . '"'
    endif
endfunction

" Получение от пользователя командной строки с которой будет запускаться
" скрипт
function! <SID>GetCmdline()
    let s:cmdline=inputdialog("Enter command line parameters:", s:cmdline, s:cmdline)
endfunction


" Удаление лишних пробелов в файле
function! <SID>TrimWhiteSpace()
    normal ma
    :retab
    :%s/\s\+$//eg
    normal 'a
endfunction

" Функция возвращает выделенный текст
function! GetSelection()
    " "unused"
        let l:line = getline("'<")
        let l:line = strpart(l:line, col("'<") - 1, col("'>") - col("'<") + 1)
        return l:line
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" Функция возвращает "[mixed-indenting]" если для отступов в
" файле совместно используются пробелы и символы табуляции.
" Если же выставлена опция "expandtab" и в файле присутствуют
" символы табуляции то возвращаемое значение будет "[expandtab-enabled]".
" Так же в противоположном случае: если опция "expandtab" не задана
" но в файле для отступов используются пробелы возвращаемым
" значением будет "[expandtab-disabled]". В остальных случаях
" результатом функции будет пустая строка
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&expandtab)
            let b:statusline_tab_warning = '[expandtab-disabled]'
        elseif (tabs && &expandtab)
            let b:statusline_tab_warning = '[expandtab-enabled]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction
" }}}
" }}}
" }}}

"    PLUGINS setup    {{{ 
"---- "Gundo"
"{{{
nnoremap <F4> :GundoToggle<CR>
"}}}
"----- "unite.vim"
"{{{
"nnoremap <C-p>nnoremap :Unite file_rec/async<cr>
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
noremap <Leader>F :Unite file_rec/async<cr>
noremap <space>f :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
"}}}
"------ "ctrlp.vim"
"{{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
"set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|gh|svn)$'

" Search and open buffer, files, recent
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>f :CtrlPMRUFiles<CR>
"}}}
"----- "tagbar.vim"
"{{{
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_width = 30
let g:tagbar_autoshowtag = 1
let g:tagbar_previewwin_pos = "topright"
let g:tagbar_autopreview = 1
"}}}  
"------ "klen/python-mode"
"{{{
" Disable pylint checking every save
"let g:pymode_lint_write = 0
let g:pymode_rope = 0
" Set key 'R' for run python code
"let g:pymode_run_key = 'R'
"Key for breakpoint
"let g:pymode_breakpoint_key = 'B' 
"}}}
"--- "vim-easymotion"
"{{{
let g:EasyMotion_leader_key = '<leader><leader>'
"}}}
"----- "davidhalter/jedi-vim"
"{{{
"отключаем проверка YCM
let g:jedi#completions_enabled = 0

let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
"let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#use_splits_not_buffers = "top"
"let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-m>"
""let g:jedi#rename_command = "<leader>r"
"занятно под ranger
let g:jedi#rename_command = "<leader>R"
"}}}
"------- "SirVer/ultisnips"
"""{{{
    ""let g:UltiSnipsSnippetsDir        = '~/.vim/snippets/'
    ""let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
    ""let g:UltiSnipsListSnippets       = '<space>l'
    ""let g:UltiSnipsExpandTrigger       = '<C-d>'
    ""let g:UltiSnipsExpandTrigger       = '<C-CR>'
    ""let g:UltiSnipsJumpForwardTrigger  = '<C-d>'
    ""let g:UltiSnipsJumpBackwardTrigger = '<C-a>'
    ""
let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
"let g:UltiSnipsListSnippets = '<c-m>'
let g:UltiSnipsListSnippets = '<c-o>'

""}}}
"---- "Shougo/neocomplete"
"{{{
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
        "\ }

"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
    "let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
""inoremap <expr><C-g>     neocomplete#undo_completion()
""inoremap <expr><C-l>     neocomplete#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  "" For no inserting <CR> key.
  ""return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
""inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
""inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
""inoremap <expr><C-y>  neocomplete#close_popup()
""inoremap <expr><C-e>  neocomplete#cancel_popup()
"" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"if !exists('g:neocomplete#force_omni_input_patterns')
    "let g:neocomplete#force_omni_input_patterns = {}
"endif
autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#auto_vim_configuration = 0
"let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

"}}}
""---- "Shougo/neosnippet"
"""""{{{
""""" Раскрыть сниппет/переход по сниппету (plugin-neocomplcache)
"""""imap <silent><C-j> <Plug>(neocomplcache_snippets_expand)
"""""smap <silent><C-j> <Plug>(neocomplcache_snippets_expand)
""""" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"" Use honza's snippets.
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"" Enable neosnippet snipmate compatibility mode
"let g:neosnippet#enable_snipmate_compatibility = 1

"" For snippet_complete marker.
"if has('conceal')
    "set conceallevel=2 concealcursor=i
"endif

"" Disable the neosnippet preview candidate window
"" When enabled, there can be too much visual noise
"" especially when splits are used.
"set completeopt-=preview
"""""}}}
"---- "Valloric/YouCompleteMe"
""{{{
"let completeopt=menu
let g:ycm_add_preview_to_completeopt = 0
""let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

"fix https://github.com/Valloric/YouCompleteMe/issues/526
inoremap <expr><BS> pumvisible()? "\<C-y>\<BS>" : "\<BS>"
inoremap <expr><C-h> pumvisible()? "\<C-y>\<C-h>" : "\<C-h>"

"TODO Set xrange completion in python
let g:ycm_seed_identifiers_with_syntax = 1
"TODO set mapping with UltiSnips

"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_log_level = 'debug'

""}}}
"    end of PLUGINS setup   }}}
