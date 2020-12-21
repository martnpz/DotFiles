###-> Fish config <-###

## Start neofetch.
neofetch

## Spark rainbow.
seq 70 | sort -R | spark | lolcat

## Starship prompt.
starship init fish | source

## Variables.
set fish_greeting                               # Disable welcome message.
set EDITOR "vim"                                # Default editor.
set VISUAL "code"                               # Graphic editor.
set fish_color_command '#87e09c'                # Command color.
set fish_color_param '#D3D0C8'

## FZF show dot files.
export FZF_DEFAULT_COMMAND="find -L"

## Aliases.
alias vi='vim'                                  # Vim editor.
alias em='emacs'                                # Emacs editor.
alias con='cd ~/.config'                           # Config folder.
alias qrest='qtile-cmd -o cmd -f restart'       # Restart Qtile
alias rr='ranger'                               # Ranger explorer.
alias pacu='sudo pacman -Syyu'                  # pacman update.
alias yup='yay -Sua'                            # yay update.
alias unlock='sudo rm /var/lib/pacman/db.lck'   # rm pacman lock.
alias insta='sudo pacman -S'                    # pacman install.
alias dou='yay -S'                              # yay install.
alias disk='df -h'                              # Disk usage.
alias esta='process_status'                     # Top process & status.
alias ..2='cd ../..'                            # Go 2 directories back.
alias ..3='cd ../../../'                        # Go 3 directories back.
alias ..4='cd ../../../..'                      # Go 4 directories back.
alias jour='journalctl -p 3 -xb'                # Journalctl log.

## Colorized elemetns list with 'exa'.
alias ll='exa -al --color=always --group-directories-first' # List form of Elements.
alias ls='exa -a --color=always --group-directories-first'  # Dirty form of Elements.

alias alis='alias_list'                        # Aliases list.
