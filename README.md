# RESaL - Resolution at Launch ![GitHub Release](https://img.shields.io/github/v/release/twcas/RESaL)

Now that "Exclusive Fullscreen" is practically an extinct feature nowadays, if you're tired of manually changing your desktop resolution to unlock upscaling resolutions in your game every time you launch it, this script may help you.

RESaL is a Windows batch script that **automatically switches your screen resolution when a game or application starts and restores it when it closes**. It is useful when you want to run a game at a higher resolution with upscaling but are locked to your monitor's native resolution.

The script will automatically detect and save your current resolution, monitor the running processes, detect when the target game or application executable starts, apply the target resolution via QRes, and automatically revert to the original resolution once the process ends.

<details>
  <summary>demonstration gif</summary>
  <img src="https://i.imgur.com/9zyYN5J.gif">
</details>

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
| `TARGET_EXE` | The application's process name as it appears in Task Manager (e.g. `re4.exe`). If not set, the script will prompt for it at runtime. |
