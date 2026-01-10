DefinitionBlock ("", "SSDT", 2, "XK746", "GPI0", 0x00001000) {
    External(\GPHD, FieldUnitObj)

    If (_OSI("Darwin")) {
        \GPHD = Zero
    }
}
