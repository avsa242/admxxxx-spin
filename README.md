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

P2/SPIN2:
* ~~p2-spin-standard-library~~ _(not yet implemented)_

## Compiler Compatibility

| Processor | Language | Compiler               | Backend     | Status                |
|-----------|----------|------------------------|-------------|-----------------------|
| P1	    | SPIN1    | FlexSpin (5.9.25-beta)	| Bytecode    | OK                    |
| P1	    | SPIN1    | FlexSpin (5.9.25-beta) | Native code | OK                    |
| P1        | SPIN1    | OpenSpin (1.00.81)     | Bytecode    | Untested (deprecated) |
| P2	    | SPIN2    | FlexSpin (5.9.25-beta) | NuCode      | _NOT YET IMPLEMENTED_ |
| P2        | SPIN2    | FlexSpin (5.9.25-beta) | Native code | _NOT YET IMPLEMENTED_ |
| P1        | SPIN1    | Brad's Spin Tool (any) | Bytecode    | Unsupported           |
| P1, P2    | SPIN1, 2 | Propeller Tool (any)   | Bytecode    | Unsupported           |
| P1, P2    | SPIN1, 2 | PNut (any)             | Bytecode    | Unsupported           |

## Limitations

* Very early in development - may malfunction, or outright fail to build
* Doesn't yet support changing I2C bus speed
* Doesn't yet support changing I2C address
* Doesn't fully support cursor positioning
* Doesn't yet support custom characters
* Not yet ported to P2
