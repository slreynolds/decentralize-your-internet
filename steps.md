
# Step 0 - Hardware and Preparations

- get the target machine: e.g. HP Pavillon 15-bc230ng
- admin  machine from where you work normally
- charger for said notebook
- a USB Stick (8GB or more)
- a mouse for setup (optional)

# Step 1 - Setup Ubuntu Boot Stick

## DL ubuntu
download 22.04 LTS latest version (https://ubuntu.com/download/server)

topics
- why ubuntu
- what is a boot stick
- disable secure boot
- what is LTS
- general ubuntu install manual

## Install rufus

- download rufus https://rufus.ie/en/ (version 4.6)
- run rufus.exe
- Rufus Update Policy --> Yes

## Run rufus

- Device: select your USB Stick (e.g. mine was on D:)
- be sure that you selected the correct stick or better, unplug all other USB sticks and disks
- Boot selection: Disk or ISO image (Please select)
- Select button: select the downloaded .iso file (ubuntu-24.04.1-live-server-amd64.iso)
- Partition scheme: MBR
- Target System: BIOS or UEFI
- Volume label: we-have-internet-at-home
- File system: FAT32
- Cluster size: 4096 bytes (Default)
- Push START
- ISOHybrid image detected: Write in ISO mode (recommended)
- Push OK
- Another Program is using this drive: Push Yes
- Warning: All data on device 'D:' will be destroyed: Push OK
- wait patiently (7 minutes for me)
- Push Close

topics
- what is a boot stick

# Step 2 - Install ubuntu

- insert the boot stick into the target machine
- boot the target machine
- find out your boot key, this depends on your hardware
  - here is a list for most manufacturers: https://www.disk-image.com/faq-bootmenu.htm
  - if you don't find your manufacturer, try in this order: F2, ESC, F10, F12, DEL, TAB 
  - use separate reboots
  - this is as stupid as it sounds
- start the machine
- frantically hit the boot key
- in the boot menu, select the boot stick
- select "Install ubuntu"
- select your language ("English")
- select your keyboard layout, via the identify option ("German")
- choose "Ubuntu Server" for base installation
- add a network connection
  - preferably via LAN
  - otherwise add wifi, although that leads to unstable setups
- test the update Archives
- Guided storage configuration: use the Default
- storage configuration: press Done
- start installation: Continue
- Profile configuration: add your name, your server name, your username, and your password
- remember your password
- Ubuntu ProSetup: skip
- SSH configuration: enable Install OpenSSH server
- Reboot after install
- you successfully installed ubuntu!

topics:
- SSH --> later

# Step 3 - Set up your admin machine

## Install git

- download git for windows: https://git-scm.com/download/win
- run the installer
  - everything default EXCEPT adding a desktop shortcut
- License: click next
- Select Components: add a shortcut to your desktop
- default editor: notepad
- naming of initial branch: let git decide
- Adjust your PATH environment: use recommended option
- choosing SSH executable: Use bundled OpenSSH
- Choosing https transport backend: Use the OpenSSL library
- Configuring the line ending conversions: Checkout Windows-style, commit Unix-style line endings
- Configuring the terminal emulator to use with Git Bash: Use MinTTY
- Choosing the default behavior of `git pull`: fast-forward or merge
- Choose a credential helper: None
- Configuring experimental options: enable file system caching
- Click Install
- Do not view the release notes

## Check that python is installed on the admin machine
- run git bash
- type 
```python
python3 --version
```
- if you get a version number, you are good to go
- if not, install python for windows: https://www.python.org/downloads/windows/


topics:
- git

# Step 4 - Make a Server out of your machine

- go to your admin machine --> bash
- create a folder "git"
```bash
mkdir git
cd git
```
- clone the workshop repo repository
```bash
git clone git@github.com:codingkrabbe/decentralize-your-internet.git
```
- publish the public key of your admin machine via http
```bash
cd decentralize-your-internet/scripts/step_4
python3 publish_public_key.py
```



Topics
- ssh keys