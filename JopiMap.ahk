; https://www.autohotkey.com/docs/KeyList.htm

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, RegEx
; #Warn  			; Debug messages

EnvGet, COMPNAME, COMPUTERNAME
CALCDOC 	= "https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-apps-139014e7-177b-d1f3-eb2e-7298b2599a34#bkmk_cal"
CUBASEDOC 	= "https://steinberg.help/cubase_pro/v11/en/cubase_nuendo/topics/chord_pads/chord_pad_zone_r.html"

; =============================================================================
; SYSTEM SHORTCUTS
; =============================================================================
PrintScreen::LWin
; PrintScreen::AppsKey
CapsLock::AppsKey
#w::^w
#^q::Send #^{F4}
^q::Send !{F4}

#'::
    if WinExist("Jopi's PowerShell") or WinExist(".*jopim@.*")
        WinActivate
    Else
        Run, wt
Return

#F1::Run, "D:\Creative Cloud Files\Photoshop Template.psdt"
+#F1::Run, "D:\Creative Cloud Files\Premiere Pro Template.prproj"
#F2::Run, "D:\Creative Cloud Files\Illustrator Template.ait"
+#F2::Run, "D:\Creative Cloud Files\After Effects Template.aet"
#F3::Run, "C:\Users\jopim\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Blender\blender.lnk"
+#F3::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Epic Games Launcher.lnk"
+^#F3::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\World Machine\World Machine Basic.lnk"
#F4::Run, "D:\Creative Cloud Files\Substance\Substance Designer Template.sbs"
+#F4::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Allegorithmic\Substance Painter.lnk"

#F5::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2019.lnk"
+#F5::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio Installer.lnk"
+^#F5::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word.lnk"
+!#F5::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"
; +^!#F5::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk"
+^!#F5::Run, "D:\OneDrive\Accessories\Office\JopiTemplate.potx"
#F6::Run, "D:\OneDrive\Accessories\RapidComposer\RapidComposer Template.rcCOMP"
+#F6::Run, "D:\OneDrive\Accessories\REAPER\REAPER.bat"
; ^#F6::Run, "C:\Users\jopim\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ableton Live 11 Trial.lnk"
+^#F6::
    if (COMPNAME = "IAPETUS") {
        Run, %CUBASEDOC%
    }
    else {
        ; Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Steinberg Cubase 10\Cubase 10.lnk"
        Run, "D:\OneDrive\Accessories\Steinberg\Project Templates\Jopi.cpr"
    }
Return
+!#F6::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe Audition 2021.lnk"
+^!#F6::Run, "D:\OneDrive\Accessories\REAPER\MTexturedStyleEditor\MTexturedStyleEditor.exe"
#F7::
    if (COMPNAME = "IAPETUS") {
        Process, Exist, loopBeMon.exe
        monitorPID := ErrorLevel
        Process, Exist, XotoPad.exe
        controlPID := ErrorLevel
        if (not monitorPID) {
            Run, "C:\Program Files (x86)\nerds.de\LoopBe1\loopBeMon.exe"
            Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\XotoPad\XotoPad.lnk"
        } else {
            Process, Close, %monitorPID%
            Process, Close, %controlPID%
        }
    } else {
        Process, Exist, TouchOSC Bridge.exe
        NewPID := ErrorLevel
        if (not NewPID) {
            Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TouchOSC Bridge\TouchOSC Bridge.lnk"
        } else {
            Process, Close, %NewPID%
        }
    }
Return
+!#F7::Run, "D:\OneDrive\Music\Falcon\Init.uvip"
; !#F7::Run, "C:\Users\jopim\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\VCV Rack.lnk"
+^#F7::Run, "C:\Users\jopim\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Postman\Postman.lnk"
+^!#F7::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\iLok License Manager.lnk"
#F8::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe Lightroom.lnk"
+#F8::Run, "D:\OneDrive\Accessories\Foobar2000\foobar2000.exe"

#F9::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Steam\Steam.lnk"
+#F9::Run, "C:\Users\jopim\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft Teams.lnk"
+^!#F9::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Registry Editor.lnk"
#F10::Run, "D:\OneDrive\Documents\Budget.xlsx"
+#F10::Run, "D:\OneDrive - University of Eastern Finland\Introduction to Open Data Science\IODS-project\IODS-project.Rproj"
+^#F10::Run, "D:\OneDrive - University of Eastern Finland\Fiji.app\Imagej-win64.exe"
+^!#F10::Run, "D:\OneDrive\Accessories\Peripherals\HScrollFun.lnk"
#F11::Run, colorcpl.exe
+#F11::
    if (COMPNAME = "SATURN") {
        Run, "D:\OneDrive\Accessories\BackupToW.bat"
    }
Return
+^#F11::Run, calc
+!#F11::Run, "D:\OneDrive\Accessories\PeaZip\peazip.exe"
+^!#F11::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
; +^!#F11::Run, "C:\Users\jopim\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Vivaldi.lnk"
#F12::Run, "D:\OneDrive\Accessories\KeePass\KeePass.exe"
+#F12::Run, cmd.exe /c code "D:\OneDrive\Accessories\JopiMap.ahk",, hide

; +^#Up::Send {AppsKey}
+^#Down::Send {Media_Play_Pause}
+^#Left::Send {Media_Prev}
+^#Right::Send {Media_Next}

; =============================================================================
; PROGRAM-SPECIFIC SHORTCUTS
; =============================================================================
#IfWinActive, ahk_exe msedge.exe
    !1::+!b 		; Focus Bookmarks bar
    !2::Send {F6}
!3::
    Send !f
    Sleep 50
    Send e
Return
F1::
    Send ^l
    Sleep 75
    Send {!}yt{Space} 
Return
F2::
    Send ^l
    Sleep 50
    Send {!}gm{Space} 
Return
F3::
    Send ^l
    Sleep 50
    Send {!}dis{Space} 
Return
F4::
    Send ^l
    Sleep 50
    Send {!}amg{Space} 
Return

#IfWinActive, ahk_exe vivaldi.exe
F1::
    Send ^l
    Sleep 75
    Send {!}yt{Space} 
Return
F2::
    Send ^l
    Sleep 50
    Send {!}gm{Space} 
Return
F3::
    Send ^l
    Sleep 50
    Send {!}dis{Space} 
Return
F4::
    Send ^l
    Sleep 50
    Send {!}amg{Space} 
Return

#IfWinActive, Calculator
    F1::Run, %CALCDOC%
Return

#IfWinActive, ahk_exe Acrobat.exe
    !1::Send ^+{F5}		; Focus nav pane
    !2::Send {F5}		; Focus doc
Return

#IfWinActive, .*KeePass
    F11::Send !il		; Show by size
    F12::Send !ixf		; Show expiring
Return
#IfWinActive, Large Entries
    F11::Send !{F4}
    ; #IfWinActive

    ; #IfWinActive, ahk_exe powershell.exe
    ; #s::Send ^{a}exit{enter}
Return

#IfWinActive, .*Jopi's PowerShell.*
    #'::Send !{Space}n
F2::
    Send +^4
    Sleep 500
    Send ^d
    Sleep 500
    Send rr{enter}
    Send +^d
    Sleep 500
    Send cal{enter}
    Send +!{right}
    Send !{left}
    Send up{enter}jo6r6m6a{enter}
Return
F1::
    Send ^d
    Sleep 500
    Send +^d
    Sleep 500
    Send +!{right}
    Send !{left}
Return
Return
#IfWinActive, .*jopim@.*
    #'::Send !{Space}n
F1::
    Send ^d
    Sleep 500
    Send rr{enter}
    Send +^d
    Sleep 500
    Send cal{enter}
    Send +!{right}
    Send !{left}
Return
Return

#IfWinActive, OneNote.*
!1::
    Send !h
    Send {Enter}{esc}
Return
Return

#IfWinActive, ahk_exe colorcpl.exe
#F11::
    Send !f{down}!s{esc}
Return

#IfWinActive, ahk_exe EXCEL.EXE
    F1::Send {AppsKey}q
Return

#IfWinActive, ahk_exe ImageJ-win64.exe
    F1::Run, "D:\OneDrive - University of Eastern Finland\Fiji.app\ImageJ.pdf"
Return

#IfWinActive, .*RapidComposer.*
    ^q::Send ^+{Delete}
Return

#IfWinActive, ahk_exe lightroom.exe
    F12::Send {SC135} 	; Forward slash (show filmstrip)
    +^f::Send {SC135}
    '::Send !vs{Enter}
    F1::Send !vs{Enter}
Return

#IfWinActive, ahk_exe MTexturedStyleEditor.exe
    F1::Run, "D:\OneDrive\Accessories\REAPER\MTexturedStyleEditor\MTexturedStyleEditor.pdf"
Return

#IfWinActive, ahk_exe Cubase11.exe
    F1::Run, %CUBASEDOC%
Return

#IfWinActive, ahk_exe Falconx64.exe
    F1::Run, "D:\OneDrive\Accessories\REAPER Iapetus\Guide.pdf"
Return

#IfWinActive, Postman
F1::
    Send ^l
    Send ^a
    Send https://localhost:8000/ 
Return
F2::
    Send ^l
    Send ^a
    Send https://localhost:8080/ 
Return
F3::
    Send ^l
    Send ^a
    Send https://www.ampparit.com/ 
Return
F4::
    Send ^l
    Send ^a
    Send https://www.thurrott.com/ 
Return
Return

#IfWinActive, iLok License Manager
    F1::Run, "https://s3.amazonaws.com/ilok-com/iLokLicenseManagerManual.pdf#page=2"
F12::
    Send !h
    Send {Down}
    Send {Enter}
Return
Return

#IfWinActive, ahk_exe peazip.exe
F12::
    Send !h
    Send {Enter}
Return
Return

#IfWinActive, Minecraft 1.*
    ; https://minecraft.fandom.com/wiki/Commands
    ; Send /weather clear|rain|thunder
!F1::
    Send t
    Sleep 100
    Send /time set day
    Send {Enter}
Return
!F2::
    Send t
    Sleep 100
    Send /time set night
    Send {Enter}
Return
!F3::
    Send t
    Sleep 100
    ; Send /time set noon
    Send /weather clear
    Send {Enter}
Return
!F4::
    Send t
    Sleep 100
    ; Send /time set midnight
    Send /weather thunder
    Send {Enter}
Return
Return

#IfWinActive, BallisticNG
    ; Guess what this does
!F1::
    Send {Left}
    Sleep 250
    Send {Left}
    Sleep 250
    Send {Up}
    Sleep 250
    Send {Up}
    Sleep 250
    Send {Enter}
    Sleep 250
    Send {Right}
    Sleep 250
    Send {Up}
    Sleep 250
    Send {Up}
    Sleep 250
    Send {Enter}
    Sleep 250
    Send {Esc}
    Sleep 250
    Send {Right}
    Sleep 250
    Send {Right}
    Sleep 250
    Send {Down}
    Sleep 250
    Send {Down}
    Sleep 250
    Send {Enter}
    Sleep 250
    Send {Enter}
    Sleep 250
    Send {Enter}
Return
Return

; #IfWinActive

; =============================================================================
; NUMBER PAD
; =============================================================================
; Numpad2::Send #^{F4}
; Numpad4::Send #^{Left}
; Numpad5::Send #{Tab}
; Numpad6::Send #^{Right}
; Numpad8::Send #^{d}

; =============================================================================
; REFERENCE & SUGGESTIONS
; =============================================================================
; # = Win
; + = shift
; ^ = ctrl
; ! = alt
; #IfWinActive, .*Mail
; #IfWinActive, .*Calendar
; #IfWinActive, Microsoft To Do