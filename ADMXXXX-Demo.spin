{
    --------------------------------------------
    Filename: ADMXXXX-Demo.spin
    Author: Jesse Burt
    Description: Demo of the ADMXXXX LCD driver
    Copyright (c) 2023
    Started Jan 21, 2023
    Updated Jan 22, 2023
    See end of file for terms of use.
    --------------------------------------------
}

CON

    _clkmode    = cfg#_clkmode
    _xinfreq    = cfg#_xinfreq

' -- User-defined constants
    SER_BAUD    = 115_200
    LED         = cfg#LED1

    SCL_PIN     = 28
    SDA_PIN     = 29
    I2C_FREQ    = 9600                          ' max is 1_000_000
' --

OBJ

    cfg :   "boardcfg.flip"
    disp:   "display.lcd-alpha.admxxxx"

PUB main{}

    ser.start(SER_BAUD)
    time.msleep(30)
    ser.clear{}
    ser.strln(string("Serial terminal started"))

    if disp.startx(SCL_PIN, SDA_PIN, I2C_FREQ, 0)
        ser.strln(string("ADMXXXX driver started (I2C)"))
    else
        ser.strln(string("ADMXXXX driver failed to start - halting"))
        repeat

    disp.clear
    disp.backlight_ena(1)

    demo{}

#include "alphanum-disp-demo.common.spinh"

DAT
{
Copyright 2022 Jesse Burt

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

