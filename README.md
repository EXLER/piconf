# piconf

> Scripts collection for Raspberry Pi.

## Raspberry Pi initial setup

* [Official NOOBS downloads](https://www.raspberrypi.org/downloads/noobs/)
* [Official Raspbian downloads](https://www.raspberrypi.org/downloads/raspbian/)

```bash
# Enable SSH
$ touch /Volumes/boot/ssh

# Automatically connect to a WiFi connection
# Create the file below using the example in the repo
$ nano /Volumes/boot/wpa_supplicant.conf

# Connect to Raspberry Pi
$ ssh pi@raspberrypi.local # Default password is 'raspberry'
```

## Available scripts

| Script Name | Description |
|---|---|---|
| piconf_defaults.sh | Changes default user password, hostname and adds custom MOTD. |


## Usage

```bash
$ sudo bash piconf_defaults.sh
```

## License

Copyright (c) 2019 by ***Kamil Marut***.

***piconf*** is under the terms of the [MIT License](https://www.tldrlegal.com/l/mit), following all clarifications stated in the [license file](LICENSE).
