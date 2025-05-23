# admxxxx-lcd
-------------

This is a P8X32A/Propeller, P2X8C4M64P/Propeller 2 driver object for the Sparkfun ADMxxxx-series alphanumeric LCDs

**IMPORTANT**: This software is meant to be used with the [spin-standard-library](https://github.com/avsa242/spin-standard-library) (P8X32A) or [p2-spin-standard-library](https://github.com/avsa242/p2-spin-standard-library) (P2X8C4M64P). Please install the applicable library first before attempting to use this code, otherwise you will be missing several files required to build the project.


## Salient Features

* I2C connection at 9600bps
* Backlight control: on/off, 24-bit RGB color setting
* Contrast control
* Cursor display mode


## Requirements

P1/SPIN1:
* spin-standard-library
* terminal.common.spinh (provided by the spin-standard-library)


P2/SPIN2:
* p2-spin-standard-library
* terminal.common.spin2h (provided by the p2-spin-standard-library)


## Compiler Compatibility

| Processor | Language | Compiler               | Backend      | Status                |
|-----------|----------|------------------------|--------------|-----------------------|
| P1        | SPIN1    | FlexSpin (6.9.4)       | Bytecode     | OK                    |
| P1        | SPIN1    | FlexSpin (6.9.4)       | Native/PASM  | OK                    |
| P2        | SPIN2    | FlexSpin (6.9.4)       | NuCode       | OK                    |
| P2        | SPIN2    | FlexSpin (6.9.4)       | Native/PASM2 | OK                    |

(other versions or toolchains not listed are __not supported__, and _may or may not_ work)


## Limitations

* Very early in development - may malfunction, or outright fail to build
* Doesn't yet support changing I2C bus speed
* Doesn't yet support changing I2C address
* Doesn't fully support cursor positioning
* Doesn't yet support custom characters

