DefinitionBlock ("", "SSDT", 2, "XK746", "PNLF", 0x00000000) {
    If (_OSI ("Darwin")) {
        External (\_SB.PCI0.GFX0, DeviceObj)

        Scope (\_SB.PCI0.GFX0) {
            Device (PNLF) {
                Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                Name (_CID, "backlight")  // _CID: Compatible ID
                Name (_UID, 0x13)  // _UID: Unique ID: 19
                Name (_STA, 0x0B)  // _STA: Status
            }
        }
    }
}
