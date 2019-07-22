# piconf

> Instantaneous configuration scripts with different solutions for Raspberry Pi.

## Raspberry Pi initial setup

* [Official NOOBS downloads](https://www.raspberrypi.org/downloads/noobs/)
* [Official Raspbian downloads](https://www.raspberrypi.org/downloads/raspbian/)

```bash
# Enable SSH
$ touch /Volumes/boot/ssh

# If you want to automatically connect to a WiFi connection, create the file below using the example in the repo
$ nano /Volumes/boot/wpa_supplicant.conf

# Connect to Raspberry Pi
$ ping raspberrypi.local # Find Raspberry's local IP address
$ ssh pi@192.168.*.* # Default password is 'raspberry'
```

## Available scripts

|     Script Name     | Description                                                   | Superuser priviliges? |
|:-------------------:|---------------------------------------------------------------|-----------------------|
|  piconf_defaults.sh | Changes default user password, hostname and adds custom MOTD. | Yes |
|  piconf_security.sh | Adds new user, removes default 'pi' user, installs `ufw` firewall and `fail2ban`. | Yes |
|  piconf_lamp.sh | Installs and sets sane defaults for LAMP stack (Apache, MariaDB, PHP) | Yes |
|                     |                       |  |


## Usage

```bash
$ sudo bash piconf_defaults.sh
```

## License

Copyright (c) 2019 by ***Kamil Marut***.

***piconf*** is under the terms of the [MIT License](https://www.tldrlegal.com/l/mit), following all clarifications stated in the [license file](LICENSE).
