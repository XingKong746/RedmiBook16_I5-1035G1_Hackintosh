DefinitionBlock ("", "SSDT", 2, "XK746", "dGpuOff", 0x00000000) {
    External (\_SB.PCI0.RP13.PXSX._OFF, MethodObj) // ACPI Path of dGPU

    Device(RMD1) {
        Name(_HID, "RMD10000") // _HID: Hardware ID

        Method (_STA, 0, NotSerialized) { // _STA: Status
            If (_OSI ("Darwin")) {
                Return (0x0F)
            } Else {
                Return (Zero)
            }
        }

        Method(_INI) {
            If (_OSI ("Darwin")) {
                // disable discrete graphics (Nvidia/Radeon) if it is present
                If (CondRefOf(\_SB.PCI0.RP13.PXSX._OFF)) {
                    \_SB.PCI0.RP13.PXSX._OFF()
                }
            } Else {}
        }
    }
}
