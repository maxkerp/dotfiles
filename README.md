# dotfiles
=======

These are my dotfiles. I use `rcm` to get a productive dev setup working within
minutes. Most of this stuff is copied/stolen from a lot of different sources
over the years. I you find something you like go ahead and take it :).
The project structures is copied over from [thoughtbot's
dotfiles](https://github.com/thoughtbot/dotfiles). Don't forget to checkout
their dotfiles.

Requirements
------------

Set zsh as your login shell:

    chsh -s $(which zsh)

Install [rcm](https://github.com/thoughtbot/rcm) on your machine.

Install
-------

Clone onto your laptop:

    git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles

Install the dotfiles:

    env RCRC=$HOME/dotfiles/rcrc rcup

After the initial installation, you can run `rcup` without the one-time variable
`RCRC` being set (`rcup` will symlink the repo's `rcrc` to `~/.rcrc` for future
runs of `rcup`). [See
example](https://github.com/thoughtbot/dotfiles/blob/master/rcrc).

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:

Disclaimer
------------

I blatantly stole most of this repo from [thoughtbot's
dotfiles](https://github.com/thoughtbot/dotfiles). I did not fork the repo for
the following reasons:

* I'm just getting started with `rcm` and I can not see how I would get my setup
  up and running with the suggested use of `dotfiles-local`.
* I want to expand this repository to include an `Aptfile` and `install.sh`
  so I only have to `wget` the `install.sh` and it sets everything up for me on
  a bare machine.
