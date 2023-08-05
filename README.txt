The tutorials I followed are the first three videos in this playlist:
https://www.youtube.com/playlist?list=PLsz00TDipIffxsNXSkskknolKShdbcALR

My OS is Ubuntu so this directory goes in:
~/.config/nvim

Because some of the settings in this tutorial would not work in the version installed from apt (0.6 I believe),
I had to install nvim from a different repository:

add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install neovim

The version of Neovim I used at the time of the first commit is:
NVIM v0.10.0-dev

I also had to install a C compiler for Ubuntu:
apt install build-essential

***

Other than the configuration shown in the video tutorial (which required a lot of debugging as the author does not explain everything),

I added the two lines below to `init.lua` to have hybrid line numbering (show the absolute number of the line the cursor is at, and relative numbers for the rest):
vim.wo.number = true
vim.wo.relativenumber = true

In order for the Nvim Tree to display the icons properly, I also had to install a font from Nerd Fonts.
I found this download page:
https://www.nerdfonts.com/font-downloads

How do I install the nerd fonts for my terminal?
Download the .zip file, then in `home/.local/share` create a directory `fonts`,
extract the `.ttf` files from the font `.zip` into this directory.
Then open this `fonts` in the explorer, click on the ttf files to preview and open,
they will display in the Fonts app which has a button to install the font.
Finally, in the Terminal preferences select that newly installed font, and it will be used in Neovim.
These Nerd Fonts will enable the Nvim Tree icons.

***

Some other notes about shortcuts and gestures

A great cheat sheet:
(https://i.imgur.com/YLInLlY.png)
(https://vimcheatsheet.com/)

Another one:
(https://www.reddit.com/r/vim/comments/wylqn7/made_a_vim_cheat_sheet_wallpaper_for_quick/)
(https://i.redd.it/a32xicnes4k91.png)

Besides these basic gestures,
* i insert behind cursor, a append after cursor
* x delete character, d delete with input of number, gesture, direction
* gg top of document, G end, numberG jump to line
* 0 jump to beginning of line
* ^ first non blank character in the line
* $ end of line
* See the difference between a word and a WORD
* w word forward, W for WORD forward
* b or B backward
* u undo, Ctrl r redo

Some other key gestures I learned afterwards:

## tabs
* `:tabnew` open a new tab
* `:tabc` close the current tab
* cycle between tabs with `gt`, `gT`
* `<number>gt` to jump to a specific tab


## screen navigation:
* `zz` center screen on cursor
* `zt` align top of screen with cursor
* `zb` align botom of screen with cursor
* `M` bring cursor to middle of screen
* `H` bring cursor to top of screen
* `L` bring cursor to bottom of screen
* Ctrl e move screen down one line
* Ctrl y move screen up one line
* Ctrl d move screen down half a page
* Ctrl u move screen up half a page
* Ctrl f move screen down a full page
* Ctrl b move screen up a full page


## registers:
* select with `v`, then `"+` to point to the OS clipboard register, then `y` to yank, and I am copying from Vim to the clipboard. (if OS integration works properly)
* `:reg` see all registers
* can name registers doing `"a` to `"z`
* using upper-case to refer to a register will append to it rather than overwrite

