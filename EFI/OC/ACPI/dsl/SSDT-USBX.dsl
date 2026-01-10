DefinitionBlock ("", "SSDT", 2, "XK746", "USBX", 0x00001000) {
    Scope (\_SB) {
        Device (USBX) {
            Name (_ADR, Zero)  // _ADR: Address

            Method (_DSM, 4, NotSerialized) { // _DSM: Device-Specific Method
                If (LNot (Arg2)) {
                    Return (
                        Buffer () {
                            0x03
                        }
                    )
                }

                Return (
                    Package () {
                        "kUSBSleepPowerSupply",
                        0x13EC,
                        "kUSBSleepPortCurrentLimit",
                        0x0834,
                        "kUSBWakePowerSupply",
                        0x13EC,
                        "kUSBWakePortCurrentLimit",
                        0x0834
                    }
                )
            }

            Method (_STA, 0, NotSerialized) { // _STA: Status
                If (_OSI ("Darwin")) {
                    Return (0x0F)
                } Else {
                    Return (Zero)
                }
            }
        }
    }
}
