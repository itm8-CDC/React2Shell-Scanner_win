# React2Shell-Scanner_win
An React2Shell convenience scanner for Microsoft Windows-based systems based on [Velociraptor](https://github.com/Velocidex/velociraptor) and yara (CVE-2025-55182, CVE-2025-66478).


## What's this?
This is a convenience scanner of the affected NextJS and ReactServerComponents versions of CVE-2025-55182 and CVE-2025-66478 (React2Shell) for Microsoft Windows-based systems.
It uses yara in velociraptor to search for .lock files which contains the affected versions. The "scan" is file based and cannot tell if the actual vulnerable package is running on the system.


| Will this? |  :white_check_mark::x: |
| ---------- | ---------------------- |
| Remediate the vulnerability | :x:   |
| Find possible indicators of React2Shell on a windows system? | :white_check_mark: |
| Find all possible variants of React2Shell even if it's heavily modified from the vendor side | :x: |

## How to use
1. [Download](https://github.com/itm8-CDC/React2Shell-Scanner_win/archive/refs/heads/main.zip) or clone this repository
2. Run "run.bat" by double clicking, elevation will be asked for if possible.
   1. It is possible that powershell will ask you to allow running a webmarked file, Press R and enter
3. Two powershell windows will be open as long as the scanner is running, when done it will close.
4. Initial benchmarking of the scanner is set to 20-30 minutes for a run, velociraptor is set with the --cpu-limit=5 flag to avoid disruptions, this can of course be removed if wanted in the .ps1 files
5. A file named nextjs_SEE_YOUR_RESULTS_HERE.zip and rsc_SEE_YOUR_RESULTS_HERE.zip should be put in the directory of the scanner
6. Unzip these file(s) and open either the json or csv file(s) to see where it found possible indicators of the affected Nextjs or RSC version(s)

### Run on linux
1. goto https://github.com/Velocidex/velociraptor/releases and find an applicable release for your system
2. In example this is for 64bit
```bash
# Requires git installed and wget, only for 64bit
git clone https://github.com/itm8-CDC/React2Shell-Scanner_win
cd React2Shell-Scanner_win
wget https://github.com/Velocidex/velociraptor/releases/download/v0.75/velociraptor-v0.75.5-linux-amd64
chmod +x velociraptor-v0.75.5-linux-amd64
./velociraptor-v0.75.5-linux-amd64 artifacts --definitions=./artifacts collect Custom.Generic.Detection.React2Shell.NextJS --output=./nextjs_SEE_YOUR_RESULTS_HERE.zip --format=csv --cpu_limit=5
./velociraptor-v0.75.5-linux-amd64 artifacts --definitions=./artifacts collect Custom.Generic.Detection.React2Shell.ReactServerComponents --output=./rsc_SEE_YOUR_RESULTS_HERE.zip --format=csv --cpu_limit=5
# See 5. in "How to use" from here
```



## Known issues
- Mounted network drives can cause issues and large wait times for the scan, please disconnect these before starting.

## Contributing
If you would like to contribute:

1. Fork the repository
2. Make and push your contributions
3. Make a Pull Request

## Contact
This repository, and anything within, comes "as-is". itm8 CDC does not provide support or similar in regards to running the scanner, or in understanding the result outside of what is found in this README.

itm8 CDC provides services as listed within our [RFC2350](https://itm8.com/itm8-cdc-rfc2350.txt).

## License
This repository is licensed under the AGPL-3.0 license - please see [LICENSE](LICENSE) for license details.

## Disclaimer
This repository and software comes as-is. itm8 CDC, authors, and contributors of this repository assumes no responsibility for errors or omissions, or for damages resulting from the use of the information and software contained within. As such, itm8 CDC, authors, and contributors of this repository assumes no liability nor obligation as arising from the provision herein.
