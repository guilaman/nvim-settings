The tutorials I followed are the first three videos in [this playlist](https://www.youtube.com/playlist?list=PLsz00TDipIffxsNXSkskknolKShdbcALR)

My OS is Ubuntu so this directory goes in:
`~/.config/nvim`

Because some of the settings in this tutorial would not work in the version installed from apt (0.6 I believe),
I had to install nvim from a different repository:

```
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install neovim
```

The version of Neovim I used at the time of the first commit is:
NVIM v0.10.0-dev

I also had to install a C compiler for Ubuntu:
`apt install build-essential`

***

Other than the configuration shown in the video tutorial (which required a lot of debugging as the author does not explain everything),

I added the two lines below to `init.lua` to have hybrid line numbering (show the absolute number of the line the cursor is at, and relative numbers for the rest):
```
vim.wo.number = true
vim.wo.relativenumber = true
```

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

[image](https://i.imgur.com/YLInLlY.png)

[site](https://vimcheatsheet.com/)

Another one:
[image](https://i.redd.it/a32xicnes4k91.png)

[reddit post](https://www.reddit.com/r/vim/comments/wylqn7/made_a_vim_cheat_sheet_wallpaper_for_quick/)

Besides these basic gestures,
* `i` insert behind cursor, `a` append after cursor
* `x` delete character, `d` delete with input of number, gesture, direction
* See the difference between a word and a WORD (skips non-alphanumeric characters to include entire word until whitespace)
* `w` word forward, `W` for WORD forward
* `b` or `B` backward
* `u` undo, Ctrl`r` redo
* `dw` delete word forward from cursor; `db` delete backward
* `dd` delete whole line
* the above action accepts a number first, like `3db` delete three words backwards from the cursor
* `v` visual mode: select text, then input action
* `y` yank: copy to register (like a clipboard, see below about naming register and using multiple ones)
* `p` put from the register, which includes content deleted with `d` or yanked with `y`
* `gg` top of document, `G` end, number`G` jump to line
* `0` jump to beginning of line
* `^` first non blank character in the line
* `$` end of line

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
* Ctrl`e` move screen down one line
* Ctrl`y` move screen up one line
* Ctrl`d` move screen down half a page
* Ctrl`u` move screen up half a page
* Ctrl`f` move screen down a full page
* Ctrl`b` move screen up a full page


## registers:
* select with `v`, then `"+` to point to the OS clipboard register, then `y` to yank, and I am copying from Vim to the clipboard. (if OS integration works properly)
* `:reg` see all registers
* can name registers doing `"a` to `"z`
* using upper-case to refer to a register will append to it rather than overwrite
* then `"ap` to put (paste) the contents recorded to register a.


## macros
[An explanation of macros here](https://www.redhat.com/sysadmin/use-vim-macros)
For a quick example, in line 92 of this file I wanted to add tildes \` around all the letters after the "Ctrl ", to display them as input in this file.

(assuming those tildes were not there, so it looked like:
```
* Ctrl e ...
* Ctrl y ...
* Ctrl d ...
```
...)

I press `q` to start recording a macro,
then `a` which can be any letter to choose a register where this macro will be recorded,
(with the current configuration, nvim will show that is is "recording macro to register a" or similar)
then perform the necessary actions
(jump word, insert, character, Esc to exit insert mode, navigate, insert, character, go down a line, go to beginning of line),
when completed and outside insert mode, press `q` again to finish recording this macro.
The macro is recorded into the register I specified (`a` in this example).
To use the macro, press `@` and the macro's letter, so `@a`:
the recorded actions are repeated once.
Since I have 5 more lines where I want to repeat the same actions, do `5@a`.
So the whole action to add tildes around the letters in these six lines would be,
starting from the first position in line 92:
`qawwi<tilde><Esc>li<tilde><Esc>j0q`, then `5@a`

## search and replace
(See [this Linuxize article](https://linuxize.com/post/vim-find-replace/) for more examples and great explanations)
`:s` is the substitute command
"The general form of the substitute command is:"
`:[range]s/{pattern}/{string}/[flags] [count]

`:s/foo/bar` replace first found instance of foo with bar.
Add `/``g` flag at the end to replace in the whole line.
`:%s/foo/bar/g` replace all instances of foo in the whole file with bar.
\* if I don't add the `g` flag to the above command, it will only attempt to replace the first instance found in each line (for the whole document), ignoring the second and further instances of the pattern in the same line.
Add `c` flag at the end to ask for confirmation for each instance.
Add `i` flag to make the pattern case-insensitive.
Example: replace all instances of "project" with "article", including python class names which will be titlecase, and function names which will be lowercase.
`:%s/project/article/gci`

If the search pattern contains slash characters /, they can be escaped with backslash `\/`, or preferably [alterative delimiters](https://vim.fandom.com/wiki/Alternate_delimiters_for_the_replace_command) can be used, such as # or % instead of / to separate the parts of the command.

If searching for a whole word (not a string that may be found as part of other words), type `\<` to mark the beginning of a word and `\>` to mark the end of the word.

The search pattern can also be a [regular expression](https://regexone.com/).

[Range of substitution](https://linuxize.com/post/vim-find-replace/#search-range): When no range is specified the command wors on the current line; the range can be one line or a range specified separating with `,` or `;` characters, using the absolute line number or special symbols.
Example: comment lines from 145 to 150
`:145,150s/^/#`

***

## tree actions

In this configuration, Ctrl`n` will open the Tree.
Ctrl`w` switches between panels, so between the tree and the open file, also cycing between open splits if any.
In the tree, `g?` will display all the mappings.
`a` to create a new file; naming as `directory/` to make one, or `directory/file` to create the whole path.
`r` to rename
`c` to copy, `x` to cut
`d` to delete
`p` paste
`y` copy name
`f` filter
