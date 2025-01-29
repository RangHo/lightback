# Lightback: Bringing the light back to backlight!

**Lightback** is a simple `runit` service that automatically saves the current
brightness value on shutdown and restores it on startup.
It works by saving the brightness value to the persisting temporary storage at
`/var/tmp/lightback`.

It is expected to run this as a system service.

## Installation and Configuration

If you have multiple devices that support backlight control through
`/sys/class/backlight` interface, you may need to specify the full path to the
desired device.
In this case, modify the `conf` file:

``` shell
DEVICE=/sys/class/backlight/<your device here>
```

Once the configuration is done, simply run `make install`.

``` shell
make install
```
