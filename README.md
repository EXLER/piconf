<h1 align="center">Winogrono</h1>

<p align="center">🍇 Raspberry Pi configuration helper.</p>

## Initial Configuration

```bash
~ >>> touch /Volumes/boot/ssh # Enable SSH
# If you want to automatically connect to a WiFi connection, create and edit the file below
~ >>> touch /Volumes/boot/wpa_supplicant.conf
~ >>> nano /Volumes/boot/wpa_supplicant.conf # Check the wpa_supplicant.example.conf file for reference
```

## Usage

```bash
# Connect to Raspberry Pi
~ >>> ping raspberrypi.local # Find Raspberry's local IP address
~ >>> ssh pi@192.168.1.100 # Default password is 'raspbbery'

# Install git and download winogrono
~ >>> sudo apt install git && git clone https://github.com/exler/winogrono
~ >>> cd winogrono/

# Launch the setup
~/winogrono >>> sudo bash ./winogrono.sh
```

## License

Copyright (c) 2018 by ***Kamil Marut***.

***Winogrono*** is under the terms of the [MIT License](https://www.tldrlegal.com/l/mit), following all clarifications stated in the [license file](LICENSE).
