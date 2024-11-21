# files.rkhunter.dev
This repository stores "dynamic" files that can be updated at runtime via the `--update` flag.

The files in this repo are served to the public via Cloudflare pages on the URL https://files.rkhunter.dev/

These files include are in subfolders for the major and patch versions and include...

**backdoorports.dat**: A text file containing a list of ports opened by backdoors and rootkits 

**mirrors.dat** : A text file containing the URL to the location where rkhunter can download these files from.

**programs_bad.dat**: A text file containing a list of version numbers of "bad" software

**rkhunter_latest.dat**:  A text file containing the string of the latest patch version.

**suspscan.dat**: ???

**i18n/**: Translation files (translations welcome)
