# piconf

> Configuration files, installation and utility scripts for various Raspberry Pi setups.

## Raspberry Pi OS

* [Raspberry Pi OS download](https://www.raspberrypi.org/downloads/raspberry-pi-os/)

```bash
# Enable SSH
$ touch /Volumes/boot/ssh

# Automatically connect to a WiFi connection
# Create the file below using the example in the repo
$ nano /Volumes/boot/wpa_supplicant.conf

# Connect to Raspberry Pi
$ ssh pi@raspberrypi.local # Default password is 'raspberry'

# Change default password
$ passwd
```

## License

Copyright (c) 2019-2020 by ***Kamil Marut***.

***piconf*** is under the terms of the [MIT License](https://www.tldrlegal.com/l/mit), following all clarifications stated in the [license file](LICENSE).
