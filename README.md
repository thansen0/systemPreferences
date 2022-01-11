# Personal system preferences

This is just a few of my personal system preferences, updated over time, for when I change machines. Nothing is commented and you'd likely be better off using another guide instead of trying to decipher what I have here.

# File locations

```
~/.vimrc
~/.tmux.conf
~/.config/sway/config
```

For i3/sway you'll have to install feh (sudo pacman -S feh) and you may have to move the config out of etc

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

### Wayland

In wayland things are different, and I modified my sway file
```
input 2:7:SynPS/2_Synaptics_TouchPad {
    natural_scroll enable
    pointer_accel .55
}
```

# Github login

First I need to create a [token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token), and then add it to my ~/.netrc file. It should look like this:

```
machine github.com login thansen0 password ghp_<token>
```

# Disk Space

We can view disk space by running 

```
df -h
```

# Vim

Simple vim commands I use a lot

```
:g/word/d // deletes all lines containing that word
:%s/original/NewWord/g // replaces original with NewWord
```

# Euler

```
ssh -XY thansen8@euler-login-2.wacc.wisc.edu
```

Use slurm job scheduler, should also allow you to query commands and look at available hardware. Basically if I wrote it, it should run under slurm. Can view [documentation here](https://wacc.wisc.edu/resources/docs/slurm.html).

# Dev Nodes

```
ssh curie
ssh gauss // older
// find system information
htop - system information
w - shows
nvidia-smi - shows gpu usage
```
And from outside of the euler login node, I can run

```
ssh thansen8@curie
```
Which should log me directly onto curie with xforwarding. This is enabled by adding this script to my ssh config file, which forwards all io past euler to my machine.

```
Host euler-login-2
    Hostname %h.wacc.wisc.edu
    User thansen8

Host curie
    Hostname %h.wacc.wisc.edu
    User thansen8
    ProxyCommand ssh euler-login-2 -W %h:%p
```

# tmux

```
tmux new -S session-name
tmux ls
tmux attach -d -t session-name
tmux attach -t session-number
tmux kill-session -t session-number
```

ctrl-b-d detach
ctrl-b-" split vertically
ctrl-b-% split horizontally
ctrl-b-h/j/l/k move left/bottom/right/up
ctrl-b-x kill current pane (non-responsive)
ctrl-b-c creates new window
ctrl-b-n change to next window
ctrl-b-0 to 9 change through window

# Wifi

```
nmcli device wifi list
nmcli device wifi connect <name>
```

# Bluetooth

```
sudo systemctl start bluetooth (.service can be added optionally)
bluetoothctl power on
bluetooth scan
```

# Docker

You can enable its startup on boot with

```
sudo systemctl start docker.service  # starts the service
sudo systemctl enable docker.service # enables, so it will start on boot every time
```

# nmap

Scan all IP's on a network. For example to scan all 192.168.1.1-254 can be done with

```
nmap -sP 192.168.1.*
nmap -sn 192.168.1.0/24
```

# Git

Set up a git server on my sibyl VPS. To initialize log into the server using
```
cd ~/git/project.git
git init --bare
```

And the I can push to that project using
```
git remote add origin git@sibyl:/home/git/git/project.git
```

Lastly I can pull from it using
```
git clone git@sibyl:/home/git/git/project.git
cd project
```

And if I need to add a new machine use ssh-copy-id, which copies my public key in id\_rsa.pub into the authorized\_keys file on the remote machine. You need to remove the back slash
```
cd ~/.ssh
ssh-keygen -t rsa // this will generate the key pair if you don't already have one
ssh-copy-id -i ~/.ssh/id\_rsa.pub git@sibyl
```

# audio input

Not fully working yet, but uncommented ```load-module module-alsa-source device=hw:0,0``` from /etc/pulse/default.pa, and installed pavucontrol (which also installed atkmm cairomm glibmm gtkmm3 libsigc++ pangomm)


Run pavucontrol to see gui open for editing audio, which is neat

# Sherlock

Used to look up usernames of other users. https://github.com/sherlock-project/sherlock.

```
python3 sherlock username
```

# Python Jupyter

Run `jupyter notebook` in the command line to open it up

# Brave (Chrome)

ctl-# to cycle through tabs
ctl-w to close current window
ctl-shift-t opens last closed tab
ctl-t opens new tab
