" vim: fdm=marker fdc=2 foldlevelstart=0 sts=4 sw=4 tw=64 fileencoding=utf-8:
set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()
"Screen совместимость
set t_Co=256
set ttymouse=xterm2
let mapleader = ","
noremap \ ,
" Шпаргалка {{{1
" ---   Folding  ----
" za - Toggle       zA - recursively
" zM - Close all    zR - Open all
" zx - udate all
" ,r - показывет регистры памяти    ,<номер> - пастит
" 
" Функциональные клавиши {{{
"Text/Code Navigation
"    F1  Help
"    F2  Code Explorer
"    F3  Find Next
"    F4  
"Explore Buffers and Files
"    F5  Execute buffer
"    F6  Buffer Explorer
"    F7  List of Files in Directory
"    F8  File Explorer
"Manipulate Windows and Buffers
"    F9  Restore Last Session
"    F10 Toggle Fullscreen
"    F11 Close Current Window
"    F12 Delete Current Buffer
" Установленные плагины и их зависимости {{{1

"============= "SYSTEM"  =============
Bundle "gmarik/vundle"
"{{{
"}}}
Bundle "scrooloose/nerdtree"
"{{{
" Установить положение окна NERDTree, "left" или "right"
let NERDTreeWinPos = 'right'
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\~$', '*.pyc', '*.pyo']
let NERDChristmasTree = 0
"}}}
Bundle "ctrlp.vim"
"{{{

set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|gh|svn)$'

" Search and open buffer, files, recent
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>f :CtrlPMRUFiles<CR>
"}}}
Bundle "easytags.vim"
"{{{

let g:easytags_python_enabled = 1 
"}}}
Bundle "taglist.vim"
"{{{
let g:Tlist_Show_Menu = 0           " Показывать меню (0-выкл/1-вкл)
let g:Tlist_Show_One_File = 1       " Показывать список тегов только из текущего файла
let g:Tlist_Enable_Fold_Column = 0  " Показывать колонку свёртки (folding)
"}}}  
Bundle "sessionman.vim"
"Bundle 'sudo.vim'
"============= "VIEW" =============
Bundle "flazz/vim-colorschemes"
Bundle "ZoomWin"
   "{{{
   "in the normal mode <c-w>o :ZoomWin will toggle between
	"* selecting the current window for display as the only window or
noremap <leader>wo <Plug>ZoomWin
	"* restoring the original multiple-window view.
    ""}}}

"============= "Productivity" =============

Bundle 'Vimtodo'
"{{{
"}}}
Bundle "vimwiki"
"{{{

"noremap <leader>tt <Plug>VimwikiToggleListItem

map <leader>tt <Plug>VimwikiToggleListItem
"}}}
"============= "Git" =============
Bundle "http://github.com/motemen/git-vim.git"
Bundle "tpope/vim-fugitive"

"============= "Python" =============
Bundle "python.vim--Vasiliev"
"{{{

" Настройка подсветки синтаксиса для python (работает для
" расширенного syntax файла python)
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
let g:python_highlight_doctests = 0
"}}}
Bundle "klen/python-mode"
"{{{
" Disable pylint checking every save
let g:pymode_lint_write = 0

" Set key 'R' for run python code
let g:pymode_run_key = 'R'
"Key for breakpoint
let g:pymode_breakpoint_key = 'B' 
"}}}
Bundle 'ivanov/vim-ipython'
"Bundle 'davidhalter/jedi-vim'
"============= "Coding" =============
Bundle "scrooloose/nerdcommenter"
 "{{{
"vis ,c<space> toggle
"vis ,cc    закомментировать
"vis ,cu    разкомментировать"}}}
Bundle "Lokaltog/vim-easymotion"
"--- vim-easymotion.settings -----"{{{
let g:EasyMotion_leader_key = '<leader><leader>'
"}}}
Bundle "neocomplcache"
"--- neocomplcache.settings -----"{{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_ignore_case = 0

 ""Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"" Включение/отключение автоматики Активация по Ctrl+Space
""let g:neocomplcache_disable_auto_complete = 0
"}}}
Bundle 'Shougo/neosnippet'
"{{{
" Раскрыть сниппет/переход по сниппету (plugin-neocomplcache)
imap <silent><C-j> <Plug>(neocomplcache_snippets_expand)
smap <silent><C-j> <Plug>(neocomplcache_snippets_expand)
"}}}
Bundle "ZenCoding.vim"
Bundle "surround.vim"
Bundle "aperezdc/vim-template"
Bundle "Rykka/colorv.vim"
"{{{
"Press '<leader>ce'(':ColorVEdit') in 'LightSlateGray'
"}}}
Bundle "AndrewRadev/inline_edit.vim"
Bundle 'tshirtman/vim-cython'

Bundle 'Indent-Guides'

Bundle 'Gundo'
"{{{
nnoremap <F4> :GundoToggle<CR>
"}}}
Bundle "https://github.com/PotatoesMaster/i3-vim-syntax.git"
Bundle 'abolish.vim'
Bundle 'Arduino-syntax-file'
"--- del? ---


" "Quick"                   Быстрые настройки {{{1
" ==============================================================================
" (0 - откл. 1 - вкл.)

" us - USer option
"let s:us_folding        = 1     " Свертывание участков кода
let s:us_linewrap       = 1     " Перенос длинных строк
let s:us_scratch_buffer = 0     " Сделать из безымянного буфера scratch буфер

" ==============================================================================
" "Includes"                Подключение доп.файлов настроек {{{1
" ==============================================================================

"source $VIMRUNTIME/mswin.vim            " Windows-like настройки

"==============================================================================
" "Basic"                   Базовые настройки {{{1
" ==============================================================================

" Отключение совместимости с vi
set nocompatible

" Включение складок
set foldenable
" Ширина колонки
"set foldcolumn=4
set foldlevelstart=99
set foldmethod=indent
set foldnestmax=3

" Включение подсветки синтаксиса
syntax on

" Включение определения типов файлов
filetype on
filetype plugin on
filetype indent on

" Отключение оповещения морганием и звуком
set novisualbell
"set t_vb=

set helplang=en,ru

" Переход на предыдущую/следующую строку
set backspace=indent,eol,start

" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set whichwrap+=<,>,[,]

" История команд
set history=300

" Максимальное количество изменений, которые могут быть отменены
set undolevels=5000

" Не создавать резервные копии файлов
set nobackup

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

" Показывать все возможные кандидаты при авто-завершении команд
set nowildmenu
set wildmode=longest,list,full

" Включение проверки орфографии, для русского и английского
set spelllang=ru_yo,en_us
"set spell

" Раскладка по умолчанию - английская
set iminsert=0

" Не перерисовывать окно при работе макросов
set lazyredraw

" use a seperate file to store history, so it works cross-session
if exists('&undofile')
  set undofile
  set undodir=$HOME/.vim/undofiles
else
  echom "no undofiles"
endif
" ==============================================================================
" "View"                    Вид {{{1
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

" ==============================================================================
" "Statusline"               Статусная строка {{{1
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

" ==============================================================================
" "Indent"                  Отступы и табуляция {{{1
" ==============================================================================

set autoindent                          " Наследовать отступы предыдущей строки
"set smartindent                         " Включить 'умные' отступы
set expandtab                           " Преобразование таба в пробелы
set shiftwidth=4                        " Размер табуляции по умолчанию
set softtabstop=4
set tabstop=4

" ==============================================================================
" "Search"                  Поиск текста {{{1
" ==============================================================================

set hlsearch        " Включение подсветки слов при поиске
set incsearch       " Использовать поиск по мере набора

" Использовать регистра-зависимый поиск (для 
" регистра-независимого использовать \с в конце строки шаблона)
"set noignorecase
set ignorecase "поменял на регистро независимый ван

" В режиме поиска используется раскладка, заданная по умолчанию
set imsearch=-1

" ==============================================================================
" ==============================================================================
" "LineWrap"                Перенос длинных строк {{{1
" ==============================================================================

if s:us_linewrap
    " Задать ширину строки
    "set textwidth=79

    if v:version >= 703
        " Подсвечивать границы
        set colorcolumn=80
    endif
    " Перенос по словам
    set linebreak
else
    " Запретить перенос строк
    set nowrap

    " показывать символы > или < если есть, что слева/справа строки
    set listchars+=precedes:<,extends:>

endif




" ==============================================================================
" "User Shortcuts"          Горячие клавиши {{{1
" ==============================================================================

" New leader key
"let mapleader = ","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" mute search highligting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Русская расскладка
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" just subsitute ESC with , jk и в рус раскл бб ол не работает
"inoremap <leader>, <Esc> 
"inoremap <leader>бб <Esc> 
inoremap jk <Esc>
"inoremap ол <Esc>

"--- "Fast copy" ------{{{
"
nmap <leader>y "*y "copy to X11 primary
nmap <leader>Y "yy
nmap <leader>p "*p " пастим из X11 primary

nmap <leader>0 "0p
nmap <leader>1 "1p
nmap <leader>2 "2p
nmap <leader>3 "3p
nmap <leader>4 "4p
nmap <leader>5 "5p
nmap <leader>6 "6p
nmap <leader>7 "7p
nmap <leader>8 "8p
nmap <leader>9 "9p
"show registers
nmap <leader>r :registers<CR>
"}}}
"--- "что висит на функциональных клавишах" ------{{{
" Открытие командной строки помощи (plugin-FuzzyFinder)"
map <C-F1> :FufHelp<cr>
vmap <C-F1> <esc>:FufHelp<cr>
imap <C-F1> <esc>:FufHelp<cr>

" Список тегов (plugin-taglist)
nmap <F2> <Esc>:TlistToggle<cr>
vmap <F2> <esc>:TlistToggle<cr>
imap <F2> <esc><esc>:TlistToggle<cr>

nnoremap <F3> :set invpaste paste?<CR>
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
map <F8> :NERDTreeToggle<cr>
vmap <F8> <esc>:NERDTreeToggle<cr>
imap <F8> <esc>:NERDTreeToggle<cr>

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
map <F11> :close<cr>
vmap <F11> <esc>:close<cr>i
imap <F11> <esc>:close<cr>i

" Удалить буфер
map <F12> :bdelete<cr>
vmap <F12> <esc>:bdelete<cr>
imap <F12> <esc>:bdelete<cr>


" Создать базу данных для файлов в текущей директории
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"}}}

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee >/dev/null %

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



" =============================================================================="}}}
" "Functions"               Пользовательские функции {{{1
" ==============================================================================

let s:cmdline = ""

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

" Сделать из безымянного буфера scratch буфер
if s:us_scratch_buffer
    augroup vimrc-scratch-buffer
        autocmd!
        autocmd BufEnter * call s:scratch_buffer()
        autocmd FileType qfreplace autocmd! vimrc-scratch * <buffer>

        function! s:scratch_buffer()
            if exists('b:scratch_buffer') || bufname('%') != '' || &l:buftype != ''
                return
            endif
            let b:scratch_buffer = 1
            setlocal buftype=nofile nobuflisted noswapfile bufhidden=hide

            augroup vimrc-scratch
                autocmd! * <buffer>
                autocmd BufWriteCmd <buffer> call s:scratch_on_BufWriteCmd()
            augroup END
        endfunction

        function! s:scratch_on_BufWriteCmd()
            silent! setl buftype< buflisted< swapfile< bufhidden< nomodified
            autocmd! vimrc-scratch * <buffer>
            unlet! b:scratch_buffer
            execute 'saveas' . (v:cmdbang ? '!' : '') ' <afile>'
            filetype detect
        endfunction
    augroup END
endif

" ==============================================================================
"
" "Fix"                     Способы устранения непоняток с настройками {{{1
"
" Узнать из какого файла переменная была установлена посл. раз
"   :verbose set переменная
"
" Список всех переменных
"   :let
"
" Список всех пользовательских функций
"   :function
"
" Список всех привязок
"   :map
"
" Показывает значения всех опций, которые отличаются от настроек по умолчанию.
"   :set
" ==============================================================================
"map <leader>tt <Plug>VimwikiToggleListItem
"inoremap <leader>tt <Plug>VimwikiToggleListItem
