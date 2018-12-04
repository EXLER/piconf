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

# Install Git and download Winogrono
~ >>> sudo apt update && sudo apt install git
~ >>> git clone https://github.com/exler/winogrono
~ >>> cd winogrono/

# Launch the setup
~/winogrono >>> sudo bash winogrono.sh
```

## License

Copyright (c) 2018 by ***Kamil Marut***.

***Winogrono*** is under the terms of the [MIT License](https://www.tldrlegal.com/l/mit), following all clarifications stated in the [license file](LICENSE).
