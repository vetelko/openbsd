set autoindent
set autowrite
set cedit=;
set exrc
set iclower
set ignorecase
set leftright
set number
set noflash
set ruler
set scroll=0
set showmatch
set showmode
set shiftwidth=4
set timeout
set tabstop=4
set wraplen=0
set wrapmargin=0
set windowname

" Some helpers
map gd :r!date +'\%d. \%B \%Y \%H:\%M'
map gg :w
map gp :r!xclip -o -selection clipboard
map gl :r!echo '------------------------------------------------------------------------'
map gf {!}fmt -72 -s -t 4 
map gn :e ~/.notesG:r!echo '' && date +"Note > \%d \%B \%Y \%H:\%M" && echo "------------------------------------------------------------------------" && echo "tag: "

" This is how to map F keys
map #1 :help

" Alt-i ... exit from insert mode and save file
map! i :wl
" Alt-n ... page down
map n 
map! n i
" Alt-m ... page up
map m  
map! m i
" Alt-r ... run file by type
map r :w:!clear && runner %
map! r :w:!clear && runner %

" Find word under cursor
map * 

" Example of abbreviation
ab xpar §
ab xeur €

