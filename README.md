# RESaL - Resolution at Launch v1.0

## About

Now that "Exclusive Fullscreen" is practically an extinct feature nowadays, if you're tired of manually changing your desktop resolution to unlock upscaling resolutions in your game every time you launch it, this script may help you.

RESaL is a Windows batch script that **automatically switches your screen resolution when a game or application starts and restores it when it closes**. It is useful when you want to run a game at a higher resolution with upscaling but are locked to your monitor's native resolution.

The script will automatically detect and save your current resolution, monitor the running processes, detect when the target game or application executable starts, apply the target resolution via QRes, and revert to the original resolution once the process ends automatically.

## Requirements

- **QRes v1.1** by Anders Kjersem — [download it from MajorGeeks](https://www.majorgeeks.com/mg/getmirror/qres,1.html) and place `QRes.exe` in the same folder as the script.

## Usage

Make sure you have the `QRes.exe` and `config.ini` files in the same folder as the batch script, run it, type the game or application process name if prompted, open the game or application, and that's it.

## Configuration

There's a `config.ini` file in the same folder with the following definitions:

```ini
TARGET_X=3840
TARGET_Y=2160
TARGET_R=144
TARGET_EXE=
```

| Key | Description |
| --- | --- |
| `TARGET_X` | Desired horizontal resolution in pixels (e.g. `3840`). |
| `TARGET_Y` | Desired vertical resolution in pixels (e.g. `2160`). |
| `TARGET_R` | Desired refresh rate in Hz (e.g. `144`). |
| `TARGET_EXE` | The game's process name as it appears in Task Manager (e.g. `re4.exe`). If not set, the script will prompt for it at runtime. |

## License

```
MIT License

Copyright (c) 2026 Lucas Miranda

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
