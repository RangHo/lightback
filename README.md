# Lightback: Bringing the light back to backlight!

**Lightback** is a simple `runit` service that automatically saves the current brightness value on shutdown and restores it on startup.
It works by saving the brightness value to the persisting temporary storage at `/var/tmp/lightback`.

> [!NOTE]
> It is expected to run this as a system service.
> To run this as a user service, make sure that the user has access to the backlight interface in sysfs.
> For more information about giving write permissions to users or groups, see [this udev rule from `brightnessctl` repository](https://github.com/Hummer12007/brightnessctl/blob/master/90-brightnessctl.rules).

## Installation and Configuration

Install the service to `/etc/sv` using `make`.

``` shell
make install
```

By default, this will query the `/sys/class/backlight` interface and use the first device that it finds.
If you have multiple devices that support backlight control through the interface, you may need to specify the full path to the desired device.
In this case, modify the `conf` file:

``` shell
DEVICE=/sys/class/backlight/<your device here>
```

Once the configuration is done, enable the service by linking to the `runit` service directory.

``` shell
ln -s /etc/sv/lightback /var/service
```
