# Advanced Linux System Cleaning

![Advanced System Cleaning logo](com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg)

This tool is my implementation of a magic "One-click maintenance" button.
It performs system cleaning and fixes some common problems that Linux users may encounter.
The advanced algorithm helps maintain your privacy when using most common web browsers and minimizes the effectiveness of personalized advertising services.

> **Note:** By default ***the system will be turned off*** after cleaning.
>
> This behavior can be changed by using `--clean-only` option to perform only cleaning. See `--help` for details.

### Supported application:

- [Firefox browser (installed via snap or package manager)](https://www.mozilla.org/en-US/firefox/new/)
- [Chromium browser](https://www.chromium.org)
- [Google Chrome browser (release, beta and unstable)](https://www.google.com/chrome/)
- [Opera browser](https://www.opera.com/)
- Electron-based applications:
  - Skype
  - Microsoft Teams
  - Visual Studio Code (also OSS, Insiders versions)
- [Simple Screen Recorder](https://github.com/MaartenBaert/ssr)
- [Kodi media center](https://kodi.tv/)
- [HandBrake](https://handbrake.fr/)
- Nvidia drivers
- [Wine](https://www.winehq.org/)
- [Ccache](https://ccache.dev/)
- [Optimus manager](https://github.com/Askannz/optimus-manager)
- System cache
- System journal
- System temp (/tmp)
- System old logs (/var/log)
- Error messages (/var/crash)
- pacman
- [Pamac](https://wiki.manjaro.org/index.php/Pamac)
- yay (AUR package manager)

Also the application performs the next actions if needed:
  - updates pacman mirrorlist from mirrorlist.pacnew
  - updates Endveavour OS mirrorlist from endeavouros-mirrorlist.pacnew
  - unlocks blocked pacman database
  - removes old PPA after release upgrade (Ubuntu)
  - removes old kernels (Ubuntu)
  - removes unused packages
  - TRIM operation for SSD/NVME drives

# Installation

There are two helper scripts to install the application manually:
- `install.sh` - this script installs the script, desktop shortcut and icon
- `install_with_extra_dependencies.sh` - this script also installs extra dependencies (bleachbit and deborphan for Debian/Ubuntu) and opens `bleachbit` to allow the User to select extra options

# Uninstall

Use `uninstall.sh` to uninstall a manually installed application.
> **Note:** To uninstall the old version of this application (which was installed in HOME) use `uninstall_old_version.sh`.

# License

MIT
