<h1 align="center">Winogrono</h1>

<p align="center">🍇 Raspberry Pi configuration helper.</p>

## Initial Configuration

* [Download NOOBS](https://www.raspberrypi.org/downloads/noobs/)
* [Download Raspbian](https://www.raspberrypi.org/downloads/raspbian/)

```bash
~ >>> touch /Volumes/boot/ssh # Enable SSH

# If you want to automatically connect to a WiFi connection, create the file below using the example in the repo
~ >>> nano /Volumes/boot/wpa_supplicant.conf # Replace the 'ssid' and 'psk' variables
```

## Usage

```bash
# Connect to Raspberry Pi
~ >>> ping raspberrypi.local # Find Raspberry's local IP address
~ >>> ssh pi@192.168.*.* # Default password is 'raspbbery'

# Download and launch Winogrono
~ >>> wget -O winogrono.tar.gz https://github.com/EXLER/winogrono/archive/0.1.2.tar.gz
~ >>> tar -xzf winogrono.tar.gz
~ >>> sudo bash winogrono-0.1.2/winogrono.sh
```

## License

Copyright (c) 2018 by ***Kamil Marut***.

***Winogrono*** is under the terms of the [MIT License](https://www.tldrlegal.com/l/mit), following all clarifications stated in the [license file](LICENSE).
