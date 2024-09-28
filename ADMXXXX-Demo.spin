{
----------------------------------------------------------------------------------------------------
    Filename:       ADMXXXX-Demo.spin
    Description:    Demo of the ADMXXXX LCD driver
    Author:         Jesse Burt
    Started:        Jan 21, 2023
    Updated:        Sep 28, 2024
    Copyright (c) 2024 - See end of file for terms of use.
----------------------------------------------------------------------------------------------------
}

CON

    _clkmode    = xtal1+pll16x
    _xinfreq    = 5_000_000


OBJ

    time:   "time"
    ser:    "com.serial.terminal.ansi" | SER_BAUD=115_200
    disp:   "display.lcd-alpha.admxxxx" | SCL=28, SDA=29, I2C_FREQ=9600, I2C_ADDR=0


PUB main() | i

    setup()

    disp.clear
    disp.backlight_ena(1)

    repeat
        disp.str(@"Testing 1 2 3")
        time.sleep(2)
        disp.clear()

        disp.str(@"Backlight")
        repeat 10
            disp.backlight_ena(0)
            time.msleep(100)
            disp.backlight_ena(1)
            time.msleep(100)

        repeat i from 255 to 0
            disp.pos_xy(0, 0)
            disp.printf3(@"%03.3d %02.2x %08.8b", i, i, i)
            time.msleep(50)
        disp.clear()
        repeat i from 0 to -255
            disp.pos_xy(0, 0)
            disp.printf3(@"%4.4d %02.2x %08.8b", i, i.byte[0], i.byte[0])
            time.msleep(50)


PUB setup()

    ser.start()
    time.msleep(30)
    ser.clear()
    ser.strln(@"Serial terminal started")

    if ( disp.start() )
        ser.strln(@"ADMXXXX driver started")
    else
        ser.strln(@"ADMXXXX driver failed to start - halting")
        repeat


DAT
{
Copyright 2024 Jesse Burt

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
}

