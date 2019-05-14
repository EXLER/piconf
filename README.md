<h1 align="center">Winogrono</h1>

<p align="center">🍇 Raspberry Pi configuration helper.</p>

## Initial Configuration

* [Download NOOBS](https://www.raspberrypi.org/downloads/noobs/)
* [Download Raspbian](https://www.raspberrypi.org/downloads/raspbian/)

```bash
# Enable SSH
$ touch /Volumes/boot/ssh

# If you want to automatically connect to a WiFi connection, create the file below using the example in the repo
$ nano /Volumes/boot/wpa_supplicant.conf # Replace the 'ssid' and 'psk' variables

# Connect to Raspberry Pi
$ ping raspberrypi.local # Find Raspberry's local IP address
$ ssh pi@192.168.*.* # Default password is 'raspberry'
```

## Usage

```bash
$ sudo bash winogrono.sh
```

## License

Copyright (c) 2018 by ***Kamil Marut***.

***Winogrono*** is under the terms of the [MIT License](https://www.tldrlegal.com/l/mit), following all clarifications stated in the [license file](LICENSE).
