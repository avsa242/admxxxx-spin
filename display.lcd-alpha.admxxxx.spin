{                                                                                                      
    --------------------------------------------
    Filename: display.lcd-alpha.admxxxx.spin
    Author: Jesse Burt
    Description: Driver for the Sparkfun ADMxxxx alphanumeric LCD
    Copyright (c) 2023
    Started Jan 21, 2023
    Updated Jan 21, 2023
    See end of file for terms of use.
    --------------------------------------------
}

CON

    SLAVE_WR    = core#SLAVE_ADDR
    SLAVE_RD    = SLAVE_WR | 1

OBJ

    i2c:    "com.i2c"
    core:   "core.con.admxxxx"
    time:   "time"

PUB startx(I2C_SCL, I2C_SDA, I2C_FREQ, ADDR_BITS): status
' Start the driver using custom I/O settings
    if (lookdown(I2C_SCL: 0..31) and lookdown(I2C_SDA: 0..31))
        if ( status := i2c.init(I2C_SCL, I2C_SDA, 9600) )
            time.usleep(core#T_POR)
            return
    return false

PUB backlight_ena(b)
' Enable backlight
'   NOTE: Enabling turns the backlight on full-brightness white
    if (b)
        bgcolor($ff_ff_ff_00)
    else
        bgcolor(0)

PUB bgcolor(c)
' Set background (backlight) color
'   Valid values (RR_GG_BB_00):
'       $00_00_00_00..$ff_ff_ff_00 (LSB ignored)
    i2c.start
    i2c.write(SLAVE_WR)
    i2c.write(core#SETTING_MODE)
    i2c.write(core#BL_RGB)
    i2c.write(c.byte[3])                        ' r
    i2c.write(c.byte[2])                        ' g
    i2c.write(c.byte[1])                        ' b
    i2c.stop

PUB contrast(l)
' Set LCD contrast
'   Valid values: 0..255 (clamped to range; default: 120)
    i2c.start()
    i2c.write(SLAVE_WR)
    i2c.write(core#SETTING_MODE)
    i2c.write(core#CONTRAST)
    i2c.write(0 #> l <# 255)
    i2c.stop()

PUB cursor_mode(mode)
' Set cursor mode
'   Valid values:
'       0: No cursor
'       1: Block, blinking
'       2: Underscore, no blinking
'       3: Underscore, block blinking
'   Any other value is ignored
    i2c.start()
    i2c.write(SLAVE_WR)
    i2c.write(core#CMD_MODE)
    case mode
        0:
            mode := %100
        1:
            mode := %101
        2:
            mode := %110
        3:
            mode := %111

    i2c.write($08 + mode)
    i2c.stop()
   
PUB clear()
' Clear the display
    i2c.start()
    i2c.write(SLAVE_WR)
    i2c.write(core#SETTING_MODE)
    i2c.write(core#CLEAR)
    i2c.stop()

PUB pos_xy(x, y) ' XXX not functional
' Set cursor position
    i2c.start()
    i2c.write(SLAVE_WR)
    i2c.write(core#CMD_MODE)
    i2c.write(128 + ((64 * y) + x))
    i2c.stop()
    time.msleep(2)
   
PUB putchar(ch)
' Display a character
    i2c.start
    i2c.write(SLAVE_WR)
    i2c.wr_byte(32 #> ch <# 123)
    i2c.stop

PUB reset()

' Pull in standard terminal methods (putbin(), putdec(), puthex(), puts(), etc)
#include "terminal.common.spinh"

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
}

