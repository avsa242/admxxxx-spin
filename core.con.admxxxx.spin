{                                                                                                      
    --------------------------------------------
    Filename: core.con.admxxxx.spin
    Author: Jesse Burt
    Description: ADMxxxx-specific constants
    Copyright (c) 2023
    Started Jan 21, 2023
    Updated Jan 21, 2023
    See end of file for terms of use.
    --------------------------------------------
}

CON

    SLAVE_ADDR  = $72 << 1
    T_POR       = 30_000

    { settings }
    SETTING_MODE= "|"
    WIDTH_20    = $03
    WIDTH_16    = $04
    LINES_4     = $05
    LINES_2     = $06
    LINES_1     = $07
    SWRESET     = $08
    EN_SPLASH   = $09
    SAVE_SPLASH = $0a
    BAUD_2400   = $0b
    BAUD_4800   = $0c
    BAUD_9600   = $0d
    BAUD_14400  = $0e
    BAUD_19200  = $0f
    BAUD_38400  = $10
    BAUD_57600  = $11
    BAUD_115200 = $12
    BAUD_230400 = $13
    BAUD_460800 = $14
    BAUD_921600 = $15
    BAUD_1000000= $16
    BAUD_1200   = $17
    CONTRAST    = $18
    I2C_ADDR    = $19
    IGN_ERESET  = $1a

    CLEAR       = "-"
    BL_RGB      = "+"

    CMD_MODE    = $fe
{
Command cheat sheet:
 ASCII / DEC / HEX
 '|'    / 124 / 0x7C - Put into setting mode
 Ctrl+c / 3 / 0x03 - Change width to 20
 Ctrl+d / 4 / 0x04 - Change width to 16
 Ctrl+e / 5 / 0x05 - Change lines to 4
 Ctrl+f / 6 / 0x06 - Change lines to 2
 Ctrl+g / 7 / 0x07 - Change lines to 1
 Ctrl+h / 8 / 0x08 - Software reset of the system
 Ctrl+i / 9 / 0x09 - Enable/disable splash screen
 Ctrl+j / 10 / 0x0A - Save currently displayed text as splash
 Ctrl+k / 11 / 0x0B - Change baud to 2400bps
 Ctrl+l / 12 / 0x0C - Change baud to 4800bps
 Ctrl+m / 13 / 0x0D - Change baud to 9600bps
 Ctrl+n / 14 / 0x0E - Change baud to 14400bps
 Ctrl+o / 15 / 0x0F - Change baud to 19200bps
 Ctrl+p / 16 / 0x10 - Change baud to 38400bps
 Ctrl+q / 17 / 0x11 - Change baud to 57600bps
 Ctrl+r / 18 / 0x12 - Change baud to 115200bps
 Ctrl+s / 19 / 0x13 - Change baud to 230400bps
 Ctrl+t / 20 / 0x14 - Change baud to 460800bps
 Ctrl+u / 21 / 0x15 - Change baud to 921600bps
 Ctrl+v / 22 / 0x16 - Change baud to 1000000bps
 Ctrl+w / 23 / 0x17 - Change baud to 1200bps
 Ctrl+x / 24 / 0x18 - Change the contrast. Follow Ctrl+x with number 0 to 255. 120 is default.
 Ctrl+y / 25 / 0x19 - Change the TWI address. Follow Ctrl+x with number 0 to 255. 114 (0x72) is default.
 Ctrl+z / 26 / 0x1A - Enable/disable ignore RX pin on startup (ignore emergency reset)
 '-'    / 45 / 0x2D - Clear display. Move cursor to home position.
        / 128-157 / 0x80-0x9D - Set the primary backlight brightness. 128 = Off, 157 = 100%.
        / 158-187 / 0x9E-0xBB - Set the green backlight brightness. 158 = Off, 187 = 100%.
        / 188-217 / 0xBC-0xD9 - Set the blue backlight brightness. 188 = Off, 217 = 100%.
         For example, to change the baud rate to 115200 send 124 followed by 18.
 '+'    / 43 / 0x2B - Set Backlight to RGB value, follow + by 3 numbers 0 to 255, for the r, g and b values.
         For example, to change the backlight to yellow send + followed by 255, 255 and 0.
}

