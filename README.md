# AIM for MacOS

AIM for MacOS brings classic Windows AIM to modern MacOS for both Intel and Apple Silicon platforms.


| Disclaimer                                                                                                                                                                                                                           |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| This project is an independent, open-source initiative and is not affiliated with, endorsed by, or associated with AOL or Yahoo! Inc. This project is entirely non-commercial and does not generate any revenue or accept donations. |
| Note that this project does not include any prioprietary binaries, rather it provides a simplified means of acquiring AIM and instaling it on your computer. |
## Overview

MacOS users who want to run Windows AIM typically do so on a clunky virtual machine. **AIM for MacOS** provides a MacOS
wrapper `.app` that runs Windows AIM natively on the MacOS desktop environment via [Wine](https://www.winehq.org/).

> Wine (originally an acronym for "Wine Is Not an Emulator") is a compatibility layer capable of running Windows
> applications on several POSIX-compliant operating systems, such as Linux, macOS, & BSD.

The wrapper `.app` is generated using [Wineskin](https://github.com/Gcenx/WineskinServer), a tool for packaging Wine and Windows apps into one runtime.

Releases are currently generated for AIM 5.1.3036 (year 2002) only, but additional versions can be added if there's
demand.

## Installation

The following explains how to configure the wrapper `.app` and install AIM inside of it.

1. **Download the Latest Release**

   Navigate to the [Releases](https://github.com/mk6i/aim-for-macos/releases) page of this repository and download the latest `.zip` archive.


2. **Unzip the `.app` File**

   Locate the downloaded file in your `Downloads` folder (or wherever you chose to save it) and double-click to unzip
   the archive.


3. **Remove Quarantine Flag**

   As the app is not notarized with Apple, you'll need to remove its quarantine flag before running. Open a terminal and
   run the command below. Adjust the file path to the `.app` extracted in the previous step as necessary.

   ```sh
   sudo xattr -d com.apple.quarantine ~/Downloads/AOL\ Instant\ Messenger.app
   ```


4. **Relocate Application**

   Drag `AOL Instant Messenger.app` to your `Applications` folder.


5. **Download AIM**

   Open `AOL Instant Messenger.app`. On your first startup, a prompt appears asking you to approve downloading the AIM
   installer from archive.org into the wrapper app. Click `Yes` to proceed and wait a few moments for the download to
   complete.


6. **Run Installer**

   Once the download is complete, the AIM installation wizard appears. Complete the installation wizard, leaving the
   default installation path untouched.


7. **Configure AIM Connection**

   Once installed, AIM should start up. Before you sign in, configure AIM to connect to your server of choice (see
   [Modern AIM Providers](#modern-aim-providers)).

    1. From the sign-on screen, click `Setup`.
    2. In the Sign On/Off category, click `Connection`.
    3. Enter the server address in the `Host` field.
    4. Click `OK` and exit the preferences manager.

## Modern AIM Providers

Some new services have taken the place of AOL's AIM network after it shut down in 2017.

- [Retro AIM Server](https://github.com/mk6i/retro-aim-server) - Run your own server for AIM 5.0-5.9!
- [AIM Oscar Server](https://github.com/ox/aim-oscar-server) - Run your own server for AIM 3.0 and older!
- [AIM Phoenix](https://iwarg.ddns.net/) - AIM service with a small, active community.
- [Running Man Instant Messenger Network](https://runningman.network/) - AIM service for AIM 3.0 and older (not
  currently supported by this project's AIM client version).
- [NINA](https://nina.chat/) - Classic Client Revival service that has support for AIM, including this version.
