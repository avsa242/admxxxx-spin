{
----------------------------------------------------------------------------------------------------
    Filename:       display.lcd-alpha.admxxxx.spin
    Description:    Driver for the Sparkfun ADMxxxx alphanumeric LCD
    Author:         Jesse Burt
    Started:        Jan 21, 2023
    Updated:        May 22, 2025
    Copyright (c) 2025 - See end of file for terms of use.
----------------------------------------------------------------------------------------------------
}

CON

    { default I/O settings; these can be overridden in the parent object }
    { display dimensions }
    WIDTH       = 20
    HEIGHT      = 4

    { I2C }
    SCL         = 28
    SDA         = 29
    I2C_FREQ    = 9600                          ' max = 1_000_000 (only 9600 supported currently)
    I2C_ADDR    = 0

    SLAVE_WR    = core.SLAVE_ADDR
    SLAVE_RD    = SLAVE_WR | 1

    I2C_MAX_FREQ= 9600


OBJ

    i2c:    "com.i2c"
    core:   "core.con.admxxxx"
    time:   "time"


PUB null()
' This is not a top-level object


PUB start(): status
' Start using default I/O settings
    return startx(SCL, SDA, I2C_FREQ, I2C_ADDR)


PUB startx(SCL_PIN, SDA_PIN, I2C_HZ, ADDR_BITS): status
' Start the driver using custom I/O settings
'   SCL_PIN:    I2C clock, 0..31
'   SDA_PIN:    I2C data, 0..31
'   I2C_HZ:     I2C clock speed (currently ignored)
'   ADDR_BITS:  I2C alternate address bit, 0..1
'   Returns:
'       cog ID+1 of I2C engine on success (= calling cog ID+1, if the bytecode I2C engine is used)
'       0 on failure
    if ( lookdown(SCL_PIN: 0..31) and lookdown(SDA_PIN: 0..31) )
        if ( status := i2c.init(SCL_PIN, SDA_PIN, 9600) )
            time.usleep(core.T_POR)
            return
    return false


PUB backlight_ena(b)
' Enable backlight
'   NOTE: Enabling turns the backlight on full-brightness white
    if ( b )
        bgcolor($ff_ff_ff_00)
    else
        bgcolor(0)


PUB bgcolor(c) | t
' Set background (backlight) color
'   Valid values (RR_GG_BB_00):
'       $00_00_00_00..$ff_ff_ff_00 (LSB ignored)
    t.byte[0] := c.byte[3]
    t.byte[1] := c.byte[2]
    t.byte[2] := c.byte[1]
    t.byte[3] := 0

    writereg(core.BL_RGB, t, 3)


PUB contrast(l)
' Set LCD contrast
'   Valid values: 0..255 (clamped to range; default: 120)
    writereg(core.CONTRAST, 0 #> l <# 255)


PUB cursor_mode(m)
' Set cursor mode
'   Valid values:
'       0: No cursor
'       1: Block, blinking
'       2: Underscore, no blinking
'       3: Underscore, block blinking
'   Any other value is ignored
    address_lcd(core.CMD_MODE)
    case m
        0:
            m := %100
        1:
            m := %101
        2:
            m := %110
        3:
            m := %111

    i2c.write($08 + m)
    i2c.stop()

   
PUB clear()
' Clear the display
    writereg(core.CLEAR)


PUB pos_xy(x, y) ' XXX not functional
' Set cursor position
    address_lcd(core.CMD_MODE)
    i2c.write(128 + ((64 * y) + x))
    i2c.stop()
    time.msleep(2)
   

PUB putchar(ch)
' Display a character
'   ch:     ASCII value (32..123) to write
    address_lcd()
    i2c.wr_byte(32 #> ch <# 123)
    i2c.stop


PUB reset()


PRI address_lcd(md=0)
' Address the LCD
'   md:     configuration mode (optional; default is none)
    i2c.start()
    i2c.write(SLAVE_WR)
    if ( md )
        i2c.write(md)


PRI writereg(reg_nr, val=0, len=1)
' Write value to register
'   reg_nr:     register
'   val:        value to write (optional; default is 0)
'   len:        length/number of bytes to write (optional; default is 1)
    address_lcd(core.SETTING_MODE)
    i2c.write(reg_nr)
    if ( len > 0 )
        i2c.wrblock_lsbf(@val, len)
    i2c.stop()


#include "terminal.common.spinh"                ' use code common to all terminal drivers
                                                '   (puts(), putbin(), putdec(), puthex(), printf()
                                                '   etc)

DAT
{
Copyright 2025 Jesse Burt

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

