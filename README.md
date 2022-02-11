# FilterWheel for ScanImage

A helper class to control a generic FilterWheel using Serial communication.

## How to install

1. Place the script `FilterWheel.m` in the ScanImage directory under `+dabs/+generic/`.
2. Edit the script and replace all strings `COM7` with the appropriate COM port number of the filter wheel.
3. In the Hardware Configuration of ScanImage, add a UserButtons Widget.
4. Add a button in the UserButtons Widget for every filter wheel position desired and enter the function `dabs.generic.FilterWheel.Go1` (replace `Go1` with `Go2`...`Go6` to match the desired position).
5. Done. Save the configuration.

## Troubleshooting

If there are any error messages when pressing the button, then most likely you need to try another COM port (step 2).
