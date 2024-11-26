# files.rkhunter.dev
This repository stores "dynamic" files that can be updated at runtime via the `--update` flag.

The files in this repo are served to the public via Cloudflare pages on the URL https://files.rkhunter.dev/

## Key files

**backdoorports.dat**: A text file containing a list of ports opened by backdoors and rootkits 

**mirrors.dat**: A text file containing the URL to the location where rkhunter can download these files from.

**programs_bad.dat**: A text file containing a list of version numbers of "bad" software

**rkhunter_latest.dat**:  A text file containing the string of the latest patch version.

**suspscan.dat**: ???

**i18n/**: Translation files (translations welcome)

## Historic Files

These files used to me made avaliable via this service but have since been removed as they are no longer is use by modern versions of rkhunter. We feel it's more dangerous to keep distributing old and insecure data.

These files were shipped as part of rkhunter up to and including v1.3.4.

**defaulthashes2.dat**: Only ever shipped as part of v1.2.7.

**defaulthashes.dat**: ???

**md5blacklist.dat**: ???

**os.dat**: A table of operating systems, descriptions and default paths.

**programs_good.dat**: ???

