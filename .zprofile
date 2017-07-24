export PATH=~/bin:$PATH

if [ -z "$TMUX" -a -z "$STY" ]; then
    if which screenfetch > /dev/null; then
        screenfetch
    fi
fi
