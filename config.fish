export DISPLAY=:0
#export GDK_SCALE=0.5
#export GDK_DPI_SCALE=2

export NNN_USE_EDITOR=nvim

# xrdb ~/.Xresources

# function nvm
#    bass source .nvm/nvm.sh --no-use ';' nvm $argv
# end

# set -x NVM_DIR ~/.nvm
# nvm use default --silent

function ll
  lsd -la $argv
end

function jl
  jless $argv
end

# function winbash
#   /mnt/c/Users/swest/Downloads/cmder/vendor/git-for-windows/bin/bash.exe
# end

function vi
  nvim $argv
end

function vim
  nvim $argv
end

function less
  /usr/bin/less -r $argv
end

function lg
  lazygit $argv
end

set fish_term24bit 1

fish_vi_key_bindings

thefuck --alias | source

set PATH  /Applications/Android\ Studio.app/Contents/jbr/Contents/Home/bin $PATH
