# Install 

1. Copy config to ~/  and then 
```
> curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. Install plugs
```
> vim ~/.vimrc

:source %

:wq!
```
Open again
```
:PlugInstall
```
3. Install YouCompleteme
```
> cd ~/.vim/plugged/YouCompleteme

> python3 install.py
```


