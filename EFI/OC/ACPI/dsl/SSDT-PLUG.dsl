DefinitionBlock ("", "SSDT", 2, "XK746", "CpuPlug", 0x00003000) {
    External (\_SB.PR00, ProcessorObj)

    Scope (\_SB.PR00) {
        Method (_DSM, 4, NotSerialized) { // _DSM: Device-Specific Method
            If (_OSI ("Darwin")) {
                If (LNot (Arg2)) {
                    Return (
                        Buffer (One) {
                            0x03
                        }
                    )
                }
                Return (
                    Package (0x02){
                        "plugin-type",
                        One
                    }
                )
            } Else {
                Return (
                    Buffer (One){
                        Zero
                    }
                )
            }
        }
    }
}
