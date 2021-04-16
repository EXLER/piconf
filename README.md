# post-config

> Post-configuration scripts and resources for servers.

## Configurations
### Dedicated servers
* Change the default password with `passwd`
* Fill missing variables in `.env`

### Raspberry Pi
* [Raspberry Pi OS download](https://www.raspberrypi.org/software/operating-systems/#raspberry-pi-os-32-bit)

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

**Connecting and auto-booting external hard drive**

1. Plug in your external hard drive to Raspberry Pi. If you are using a NTFS formatted drive, install the following package
```bash
$ sudo apt install ntfs-3g
```

2. Run the following command
```bash
$ sudo blkid
```
Write down the UUID of the device connected as `/dev/sda1`

3. Create the mount directory
```bash
$ sudo mkdir /mnt/external
$ sudo chmod 770 /mnt/external
```

4. Use the `id` command to obtain the `uid`, `gid` for your user (user `pi` has both equal to 1000)
5. Mount the hard drive and check if its accessible
```bash
$ sudo mount -t ntfs-3g -o nofail,uid=1000,gid=1000,umask=007 /dev/sda1 /mnt/external
```
If this command fails, run the `rpi-update` command and reboot the Pi to update firmware.

6. Add the mount configuration to `/etc/fstab` to automatically mount the external hard drive.
```bash
$ sudo nano /etc/fstab

# Append at the end of the file
UUID=276065A9727C5848 /mnt/external ntfs-3g async,big_writes,noatime,nodiratime,nofail,uid=1000,gid=1000,umask=007 0 0
```

## License

Copyright (c) 2019-2021 by ***Kamil Marut***.

`post-config` is under the terms of the [MIT License](https://www.tldrlegal.com/l/mit), following all clarifications stated in the [license file](LICENSE).
