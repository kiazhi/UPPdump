# UUP dump

This guide has no affiliation with [UUP dump](https://uupdump.net).

The sole purpose is to demonstrate how you can cleanly download, and compile
those packages into an ISO image from a container using Docker Compose and
Dockerfile.

## Getting Started

This is just a simple guide on how to cleanly download an ISO from
[UUP dump](https://uupdump.net) for experiments.

### Run the UUP dump container

Open the terminal, use `docker compose` to build and run the container.

```sh
docker compose up
```

### Interact with the UUP dump container

Open the terminal, use `docker exec -it` to interactive execute commands within
the container.

```sh
docker exec -it $ContainerName $Commands
```

#### Example

In this example, it demonstrates how to use `docker exec -it` to interact with
the container to display operating system version.

```sh
docker exec -it b2b467d3e073 cat /etc/os-release
```

```output
PRETTY_NAME="Ubuntu 22.04.1 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.1 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Working with attached volume

Download your UUP dump download package and move the downloaded package into
the `cache` directory. Use the `docker exec -it` command to list the working
directory content now.

```sh
docker exec -it $ContainerName ls -lR
```

```output
.:
total 0
drwx------ 8 root root 256 Aug 16 04:01 25179

./25179:
total 20
-rw-rw-rw- 1 root root  511 Aug 15 21:58 ConvertConfig.ini
drwxr-xr-x 9 root root  288 Aug 16 03:59 files
-rw-rw-rw- 1 root root 2895 Aug 15 21:58 uup_download_linux.sh
-rw-rw-rw- 1 root root 2895 Aug 15 21:58 uup_download_macos.sh
-rw-rw-rw- 1 root root 4567 Aug 15 21:58 uup_download_windows.cmd

./25179/files:
total 8244
-rw-r--r-- 1 root root  523776 Aug 14 02:54 7zr.exe
-rw-r--r-- 1 root root 5949966 Aug 14 02:54 aria2c.exe
-rw-r--r-- 1 root root   19702 Aug 14 02:54 convert.sh
-rw-rw-rw- 1 root root      35 Aug 15 21:58 convert_config_linux
-rw-rw-rw- 1 root root      35 Aug 15 21:58 convert_config_macos
-rw-r--r-- 1 root root   81010 Aug 14 02:54 convert_ve_plugin
-rw-r--r-- 1 root root 1852420 Aug 14 02:54 uup-converter-wimlib.7z
```

### Start the download

Change the permission to execute permission on the download script and execute
the download script.

```sh
docker exec -it $ContainerName chmod +x ./25179/uup_download_linux.sh
docker exec -it $ContainerName ./25179/uup_download_linux.sh
```

### Convert to ISO

Change the permission to execute permission on the convert script and execute
the convert script.

```sh
docker exec -it $ContainerName chmod +x ./25179/files/convert.sh
docker exec -it $ContainerName ./25179/files/convert.sh
```

### Terminal the UUP dump container

Open the terminal, use `docker compose` to terminate the container service.

```sh
docker compose down
```

That's all. You can obtain your ISO from the `./cache` directory and delete
everything else in the `./cache` directory after use.
