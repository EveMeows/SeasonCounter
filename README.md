# DST Counter

A tiny season counter written in lua!

>[!NOTE]
>I wrote this shit in 15 minutes lmao

# Usage
```bash
counter --day 132 --size veryshort

counter --help
# Don't starve together season counter (v1.0)
#
# Easily see what season falls on a certain day.
#
# Options:
#   --day [DAY int] which day to count. [default 1]
#   --size [SEASON string] which season size to count. [default "default"]
#       OPTIONS: [veryshort, short, default, long, verylong]
#
# Flags:
#   --help Display this message.

```

# Building and Running
Since this is simply a lua app; all you need is lua and git.

```bash
# Windows
winget install DEVCOM.Lua Git.Git

# Linux 
## Ubuntu/Debian
sudo apt install lua5.4 git

## Fedora
sudo dnf in lua git

## Arch
sudo pacman -S lua git
```

Now, we can clone and run.

```bash
git clone https://github.com/EveMeows/counter
cd counter

lua main.lua --help
```

# License
GPL 3.0
