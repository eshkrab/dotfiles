PATH=$PATH:/usr/local/bin:/Users/eshkrab/bin:/Users/eshkrab/dev/esp/xtensa-esp32-elf/bin
PATH="/usr/local/sbin:$PATH"
PATH=$PATH:/opt/gcc-arm/bin
PATH=$PATH:/usr/local/lib/python2.7/site-packages/
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

function on() { if curl -X POST --data-urlencode "task=$*" https://api.workingon.co/hooks/incoming?token=52abf1c274b964fa44ee9ee0c2c69eaade6b99aa72cd8718b315666c53a7b00c >/dev/null 2>&1; then echo "Task sent."; else echo "FAILED!"; fi }

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

. /Users/eshkrab/torch/install/bin/torch-activate

# # Set CLICOLOR if you want Ansi Colors in iTerm2 
# export CLICOLOR=1
#
# Set colors to match iTerm2 Terminal Colors
# if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#         export TERM='xterm-256color'
# else
#         export TERM='xterm-color'
# fi
export TERM='xterm-256color'
# get correct colors in vim in tmux
alias tmux='tmux -2'

#ESP32 programming
export IDF_PATH=~/dev/esp/esp-idf

export FZF_DEFAULT_OPTS='--height 40%'
export EDITOR='vim'
