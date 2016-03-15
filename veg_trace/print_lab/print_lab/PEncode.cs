using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;

namespace print_lab
{
    class PEncode
    {
        [DllImport("VSN_DLL.dll", EntryPoint = "HSEncode")]
        unsafe public static extern int HSEncode(int nMessageType,
                        byte* pbyEncodeMessage,
                        int nEncodeMessageLength,
                        int nCorrectionLevel,
                        int nVersion,
                        int nModeSize,
                        int nRotate,
                        int nDbi,
                        int nImageType,
                        String nPath);
    }
}
