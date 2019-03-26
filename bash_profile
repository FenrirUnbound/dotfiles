# Compatability for non-login, non-interactive shells
export BASH_ENV=~/.bashrc

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
