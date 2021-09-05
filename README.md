# Personal system preferences

This is just a few of my personal system preferences, updated over time, for when I change machines. Nothing is commented and you'd likely be better off using another guide instead of trying to decipher what I have here.

# File locations

```
~/.vimrc
~/.tmux.conf
~/.config/i3/config
```

For i3 you'll have to install feh (sudo pacman -S feh) and you may have to move the config out of etc

# Scroll direction

To invert scrolling, you'll want to edit your xorg server by adding ```Option "NaturalScrolling" "True"``` to the touchpad and mouse InputClass in /usr/share/X11/xorg.conf.d/40-libinput.conf

```
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
....

Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
```

# Login (github)

First I need to create a [token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token), and then add it to my ~/.netrc file. It should look like this:

```
machine github.com login thansen0 password ghp_<token>
```

