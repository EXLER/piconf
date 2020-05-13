# piconf

> Scripts collection for Raspberry Pi.

## Raspbian Setup

* [Official Raspbian downloads](https://www.raspberrypi.org/downloads/raspbian/)
* [Raspbian image customisation](https://www.pibakery.org/)

```bash
# Enable SSH
$ touch /Volumes/boot/ssh

# Automatically connect to a WiFi connection
# Create the file below using the example in the repo
$ nano /Volumes/boot/wpa_supplicant.conf

# Connect to Raspberry Pi
$ ssh pi@raspberrypi.local # Default password is 'raspberry'
```

## DietPi Setup

* [Official DietPi downloads](https://dietpi.com)

Initial configuration file can be found in the downloaded archive under the name `dietpi.txt`.

```bash
# Connect to Raspberry Pi
$ ssh pi@192.168.0.100 # Default password is 'dietpi'

# Launch DietPi menu
$ dietpi-launcher

# Install additional software
$ dietpi-software
```

## Available Scripts

| Script Name | Description |
|---|---|
| piconf_defaults.sh | Changes default user password, hostname and adds custom MOTD. |


## Usage

```bash
$ sudo bash piconf_defaults.sh
```

## License

Copyright (c) 2019 by ***Kamil Marut***.

***piconf*** is under the terms of the [MIT License](https://www.tldrlegal.com/l/mit), following all clarifications stated in the [license file](LICENSE).
