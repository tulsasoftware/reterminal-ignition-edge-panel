# reterminal-ignition-edge-panel
Instructions on how to setup a Seeed Studio ReTerminal DM with Ignition Edge Panel software

# Hardware Prerequisite
- reTerminal DM x 1
- PC / Mac with SSH terminal capability
- 12-24V DC power supply
- Ethernet cable

*This guide assumes your reTerminal DM is running a fresh install of Raspberry Pi OS(x64) with SSH access from another client device. See [instructions to flash the ReTerminal DM operating system](https://wiki.seeedstudio.com/reterminal-dm-flash-OS/#steps-for-flashing-raspbian-os) if you require detailed instructions on this procedure.*

# Installing Ignition Edge

From an SSH console into your ReTerminal:

Get the ignition edge download/install script. This downloads the Ignition Edge package, extracts it to the proper locations and sets it to launch on boot.
`curl -o download-ignition-edge.sh https://raw.githubusercontent.com/tulsasoftware/reterminal-ignition-edge-panel/main/download-ignition-edge.sh`

Once you've downloaded the script, mark it as executable and run it. You will need superuser credentials in order to create the necessary directories. Go grab a coffee, this will take a few minutes to install.
`sudo chmod +x ./download-ignition-edge.sh`
`sudo ./download-ignition-edge.sh`

When the installation is complete there will be a notice to reboot the ReTerminal in order for the service to run. Reboot the device and when it is back online you can easily tell if the service is running if you can load the Ignition Edge license agreement page when you use a web browser either on the ReTerminal at `localhost:8088` OR another device on the network at `{reterminalhostname}:8088`.