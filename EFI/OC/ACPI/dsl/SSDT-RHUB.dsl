DefinitionBlock ("", "SSDT", 2, "XK746", "UsbReset", 0x00001000) {
    External (\_SB.PCI0.TXHC.RHUB, DeviceObj)

    Scope (\_SB.PCI0.TXHC.RHUB) {
        Method (_STA, 0, NotSerialized) { // _STA: Status
            If (_OSI ("Darwin")) {
                Return (Zero)
            } Else {
                Return (0x0F)
            }
        }
    }


    External (\_SB.PCI0.XHC.RHUB, DeviceObj) // Full pathing to RHUB, change to yours

    Scope (\_SB.PCI0.XHC.RHUB) { // Full pathing to RHUB, change to yours
        Method (_STA, 0, NotSerialized) { // _STA: Status
            If (_OSI ("Darwin")) {
                Return (Zero) // This disables the device only in macOS
            } Else {
                Return (0x0F) // Re-enables it for Windows
            }
        }
    }
}
