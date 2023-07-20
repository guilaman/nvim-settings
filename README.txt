The tutorial I followed are the first three videos in this playlist:
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

