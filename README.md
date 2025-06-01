# Lightback: Bringing the light back to backlight!

**Lightback** is a simple `runit` service that automatically saves the current brightness value on shutdown and restores it on startup.
It works by saving the brightness value to the persisting temporary storage at `/var/tmp/lightback`.

> [!NOTE]
> It is expected to run this as a system service.
> To run this as a user service, make sure that the user has access to the backlight interface in sysfs.
> For more information about giving write permissions to users or groups, see [this udev rule from `brightnessctl` repository](https://github.com/Hummer12007/brightnessctl/blob/master/90-brightnessctl.rules).

## Installing

There are multiple ways of installing this.
Once installed, there will be a new service named `lightback` present in the `/etc/sv` directory.

### Install from pre-packaged repository

This package is available in my personal Void package repository.
Check [the relevant section in the repository README](https://github.com/RangHo/repository#void-linux-repository) for more information.

Once the repository is added you can install it like any other package.

``` shell
sudo xbps-install lightback
```

### Install from local repository

This is the recommended method of installing custom packages.

First, clone the `void-packages` repository.

``` shell
git clone https://github.com/void-linux/void-packages
```

Then, add `lightback` repository into the `void-packages/srcpkgs` directory.
This can be done by copying the repository content or adding this repository as a submodule.

``` shell
cp -r /path/to/lightback /path/to/void-packages/srcpkgs/

# or

cd /path/to/void-packages
git submodule add https://github.com/RangHo/lightback srcpkgs/lightback

# but not
#     ln -s /path/to/lightback /path/to/void-packages/srcpkgs/
# because XBPS will consider symlinks as an alias to an existing `srcpkg`.
```

Visit the `void-packages` directory and use `xbps-src` utility to build the package.

``` shell
cd /path/to/void-packages
./xbps-src binary-bootstrap # bootstrap the masterdir if needed
./xbps-src pkg lightback
```

Finally, use XBPS to install the package.

``` shell
sudo xbps-install --repository /path/to/void-packages/hostdir/binpkgs lightback
```

### Install manually

This utility is a simple `runit` service; thus, manual installation is easy.

Copy the `files/lightback` directory into `/etc/sv` directory.

``` shell
cp -r /path/to/lightback /etc/sv/
```

## Configuring

By default, this will query the `/sys/class/backlight` interface and use the first device that it finds.
If you have multiple devices that support backlight control through the interface, you may need to specify the full path to the desired device.
In this case, modify the `conf` file:

``` shell
DEVICE=/sys/class/backlight/<your device here>
```

## Enabling

Once the configuration is done, enable the service by linking to the `runit` service directory.

``` shell
ln -s /etc/sv/lightback /var/service
```
