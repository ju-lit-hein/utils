if status is-interactive
    # Commands to run in interactive sessions can go here
end

command gk epitech
command xset s off
command xset -dpms
# do not config here
# go to ./conf.d/ and create and appropriate [category].fish file

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/julithein/.ghcup/bin # ghcup-env