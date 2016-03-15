Set WshShell=WScript.CreateObject("WScript.Shell")
WshShell.Run "front41.exe"
WScript.Sleep 200
WshShell.Sendkeys "+"
WScript.Sleep 200
WshShell.SendKeys "f"
WshShell.SendKeys "{ENTER}"
WshShell.SendKeys "tjny.INS"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 2000

