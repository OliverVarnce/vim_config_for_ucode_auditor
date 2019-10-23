set nocompatible              " be improved, required for Vundle
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" User defined plugins
Plugin 'SirVer/ultisnips'                                                     
Plugin 'honza/vim-snippets'                                                    
Plugin 'scrooloose/nerdtree'
Plugin 'Rip-Rip/clang_complete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" " Put your non-Plugin stuff after this line
" Отступы пробелами, а не табуляциями
set expandtab
" Ширина строки 80 символов
set textwidth=80
" Ширина табуляции в колонках
set ts=2
" Количество пробелов (колонок) одного отступа
set shiftwidth=2
" Новая строка будет с тем же отступом, что и предыдущая
set autoindent
" Умная расстановка отступов (например, отступ при начале нового блока)
set smartindent

syntax on
" Указывать номера строк
set number
" Подсветить максимальную ширину строки
let &colorcolumn=&textwidth
" Цвет линии - тёмно-серый
highlight ColorColumn ctermbg=darkgray

" Игнорировать регистр при поиске
set ic
" Подсвечивать поиск
set hls
" Использовать последовательный поиск
set is

" Включаем bash-подобное дополнение командной строки
set wildmode=longest:list,full
" Высота окон по-умолчанию 20 строк
set winheight=20

set fileencoding=utf-8

" С/C++ файлы
" Расставлять отступы в стиле С
autocmd filetype c,cpp set cin

" make-файлы
" В make-файлах нам не нужно заменять табуляцию пробелами
autocmd filetype make set noexpandtab
autocmd filetype make set nocin

" html-файлы
" Не расставлять отступы в стиле С в html файлах
autocmd filetype html set noexpandtab
autocmd filetype html set nocin
autocmd filetype html set textwidth=160

" css-файлы
" Не расставлять отступы в стиле C и не заменять табуляцию пробелами
autocmd filetype css set nocin
autocmd filetype css set noexpandtab

" python-файлы
" Не расставлять отступы в стиле С
autocmd filetype python set nocin

"Clang-completer
" Включить дополнительные подсказки (аргументы функций, шаблонов и т.д.)
let g:clang_snippets=1
" Использоать ultisnips для дополнительных подскахок (чтобы подсказки шаблонов
" автогенерации были в выпадающих меню)
let g:clang_snippets_engine = 'ultisnips'
" Периодически проверять проект на ошибки
let g:clang_periodic_quickfix=1
" Подсвечивать ошибки
let g:clang_hl_errors=1
" Автоматически закрывать окно подсказок после выбора подсказки
let g:clang_close_preview=1
" По нажатию Ctrl+F проверить поект на ошибки
map <c-f> :call g:ClangUpdateQuickFix()<cr>

" NERDTree
" Открывать дерево по нажаить Ctrl+n
map <c-n> :NERDTreeToggle<cr>
" Немного магии, если мы запустим Vim без указания файла для редактирования,
" то дерево будет открыто, а если будет указан файл, то дерево
" открыто не будет
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Открывать новые окна справа
set splitright

" Snippets
" Раскрыть шаблон
let g:UltiSnipsExpandTrigger="<c-a>"
" Отобразить список шаблонов
let g:UltiSnipsListSnippets="<c-d>"
" Идти вперед по шаблонам
let g:UltiSnipsJumpForwardTrigger="<c-b>"
" Идти назад
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Разделять окно вертикально при редактировании
let g:UltiSnipsEditSplit="vertical"
" Версия Python (Нужно указать используемую в системе по-умолчанию)
let g:UltiSnipsUsePythonVersion=2


