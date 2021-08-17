; https://www.autohotkey.com/docs/KeyList.htm
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, RegEx
; #Warn  			; Debug messages
EnvGet, COMPUTER, COMPUTERNAME
EnvGet, USER, USERNAME
Init()

TESTFILES := []
Loop Files, % START_MENU_USER . "Steam\*.*"
{
    if (A_LoopFileName != "Steam") {
        TESTFILES.Push(A_LoopFilePath)
    }
}

; https://duckduckgo.com/bang
DUCKDUCKGO_BANGS := ["yt", "gm", "dis", "amg", "w", "rw", "tw", "gt", "forvo"]
DUCKDUCKGO_BANGS[10] := "i"
ALT_BROWSER := START_MENU . "Microsoft Edge.lnk """

; =============================================================================
; TEMPORARY SHORTCUTS (WIPs, learning, evaluation)
; =============================================================================
!#F1:: ; Launch random game
    Random, rnd, 1, TESTFILES.Count()
    Run, % TESTFILES[rnd]
Return

; =============================================================================
; EXPANSIONS
; =============================================================================
::!name::Jopi Mikkonen
::!name2::Jopi J. W. Mikkonen
::!nick::CGBoing
::!email::jopi.mikkonen@gmail.com
::!imail::jopi.mikkonen@iki.fi
::!phone::{+}358443041982
::!street::Kirkkokatu 34 B 17
::!zip::70100
::!city::Kuopio
::!work::
    ( LTrim
    Yliopistonranta 1
    70211 Kuopio
    )
Return
::!fox::
    ( LTrim
    The quick brown fox jumps over the lazy dog.
    )
Return
::!lorem::
    ( LTrim
    Voluptates fugiat necessitatibus dolorem est. Et sed illum et qui cumque. Sed sapiente officiis veniam suscipit voluptatem. Doloremque et hic quaerat dolorum sunt id voluptas. Consequuntur maiores cupiditate rerum numquam incidunt. Libero quia sit et. Saepe occaecati dolore et et est. Ut voluptatibus aspernatur molestias nisi. Autem amet vel inventore officiis. Perspiciatis inventore quibusdam nesciunt nisi quos et. Adipisci aspernatur tempora nemo dolores aut ut. Id quidem natus voluptatibus consequuntur rerum officiis quam distinctio. Voluptatibus molestiae culpa dicta vel. Nihil et quia delectus consequuntur. Optio sapiente assumenda tenetur. Dolorem et quae eum facere. Perferendis commodi placeat quam neque iste. Perspiciatis et et est est libero voluptatem. Consequatur cupiditate veritatis voluptas eius velit officia. Dolorum qui et sunt.
    )
Return

; =============================================================================
; SYSTEM SHORTCUTS
; =============================================================================
PrintScreen::LWin
; PrintScreen::AppsKey
CapsLock::AppsKey
#w::^w
#n::#a
#^q::Send #^{F4}
^q::Send !{F4}

#'::
    if WinExist("Jopi's PowerShell") or WinExist(".*jopim@.*")
        WinActivate
    Else
        Run, wt
Return

#F1::Run, % CREATIVE_CLOUD . "Photoshop Template.psdt"
+#F1::Run, % CREATIVE_CLOUD . "Illustrator Template.ait"
+^#F1::Run, % CREATIVE_CLOUD . "Premiere Pro Template.prproj"
+!#F1::Run, % CREATIVE_CLOUD . "After Effects Template.aet"

#F2::Run, % START_MENU_USER . "Blender\blender.lnk"
+#F2::Run, % START_MENU . "Epic Games Launcher.lnk"
+^#F2::Run, % CREATIVE_CLOUD . "Substance\Substance Designer Template.sbs"
+!#F2::Run, % START_MENU . "Allegorithmic\Adobe Substance 3D Painter\Adobe Substance 3D Painter.lnk"
+^!#F2::Run, % START_MENU . "World Machine\World Machine Basic.lnk"

#F5::Run, % START_MENU . "Visual Studio 2019.lnk"
+#F5::Run, % START_MENU . "Visual Studio Installer.lnk"
+^#F5::Run, % START_MENU . "Word.lnk"
+!#F5::Run, % START_MENU . "Excel.lnk"
^!#F5::Run, % ACCESSORIES . "Peripherals\HScrollFun.lnk"
+^!#F5::Run, % ACCESSORIES . "Office\JopiTemplate.potx"

#F6::Run, % ACCESSORIES . "RapidComposer\RapidComposer Template.rcCOMP"
+#F6::Run, % ACCESSORIES . "REAPER\REAPER.bat"
+^#F6::
    if (COMPUTER = "SATURN") {
        Run, % ACCESSORIES . "Steinberg\Project Templates\Jopi.cpr"
    } else {
        Run, "https://steinberg.help/cubase_pro/v11/en/cubase_nuendo/topics/chord_pads/chord_pad_zone_r.html"
    }
Return
+!#F6::Run, % START_MENU . "Adobe Audition 2021.lnk"
^!#F6::Run, % START_MENU . "Renoise 3.3.2 (x64)\Renoise 3.3.2 (x64).lnk"
+^!#F6::Run, % START_MENU_USER . "Image-Line\FL Studio 20.lnk"

#F7::
    if (COMPUTER = "IAPETUS") {
        Process, Exist, loopBeMon.exe
        monitorPID := ErrorLevel
        Process, Exist, XotoPad.exe
        controlPID := ErrorLevel
        if (not monitorPID) {
            Run, "C:\Program Files (x86)\nerds.de\LoopBe1\loopBeMon.exe"
            Run, % START_MENU . "XotoPad\XotoPad.lnk"
        } else {
            Process, Close, %monitorPID%
            Process, Close, %controlPID%
        }
    } else {
        Process, Exist, TouchOSC Bridge.exe
        NewPID := ErrorLevel
        if (not NewPID) {
            Run, % START_MENU . "TouchOSC Bridge\TouchOSC Bridge.lnk"
        } else {
            Process, Close, %NewPID%
        }
    }
Return
+#F7::Run, % ONEDRIVE . "Music\Falcon\Init.uvip"

#F8::Run, % START_MENU . "Adobe Lightroom.lnk"

#F9::Run, % START_MENU_USER . "Steam\Steam.lnk"
+#F9::Run, % ALT_BROWSER . "www.retrogames.cc/user/favorite-game.html"

#F10::Run, % ONEDRIVE . "Documents\Budget.xlsx"
+#F10::Run, % START_MENU_USER . "Microsoft Teams.lnk"
+^#F10::Run, % ONEDRIVE_UEF . "Introduction to Open Data Science\IODS-project\IODS-project.Rproj"
+!#F10::Run, % ONEDRIVE_UEF . "Fiji.app\Imagej-win64.exe"
+^!#F10::Run, % ONEDRIVE . "Jopi.mlx"

#F11::Run, colorcpl.exe
+#F11::
    if (COMPUTER = "SATURN") {
        Run, % ACCESSORIES . "BackupToW.bat"
    }
Return

+^#Down::Send {Media_Play_Pause}
+^#Left::Send {Media_Prev}
+^#Right::Send {Media_Next}

#F12::ShutDownDialog()
+#F12::Run, % CODE . A_ScriptFullPath

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
Return

#IfWinActive, ahk_exe vivaldi.exe
    F1::DuckDuckGoSearch(DUCKDUCKGO_BANGS[1])
    F2::DuckDuckGoSearch(DUCKDUCKGO_BANGS[2])
    F3::DuckDuckGoSearch(DUCKDUCKGO_BANGS[3])
    F4::DuckDuckGoSearch(DUCKDUCKGO_BANGS[4])
    F5::DuckDuckGoSearch(DUCKDUCKGO_BANGS[5])
    F6::DuckDuckGoSearch(DUCKDUCKGO_BANGS[6])
    F7::DuckDuckGoSearch(DUCKDUCKGO_BANGS[7])
    F8::DuckDuckGoSearch(DUCKDUCKGO_BANGS[8])
    F9::DuckDuckGoSearch(DUCKDUCKGO_BANGS[9])
    F10::DuckDuckGoSearch(DUCKDUCKGO_BANGS[10])
Return

#IfWinActive, ahk_exe explorer.exe
    F1::Run, "https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec"
Return

#IfWinActive, Calculator
    F1::Run, "https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-apps-139014e7-177b-d1f3-eb2e-7298b2599a34#bkmk_cal"
Return

#IfWinActive, ahk_exe Acrobat.exe
    F1::Send !vpv		
    !1::Send ^+{F5}		; Focus nav pane
    !2::Send {F5}		; Focus doc
Return

#IfWinActive, .*KeePass
    F11::Send !il		; Show by size
    F12::Send !ixf		; Show expiring
Return
#IfWinActive, Large Entries
    F11::Send !{F4}
Return

#IfWinActive, .*Jopi's PowerShell.*
    #'::Send !{Space}n
    F1::TerminalPanes("", "rr", "cal")
    !F1::Send wsl{space}stack{space}ghci{enter}
F2::
    Send +^4
    TerminalPanes("up{Enter}jo6r6m6a", "rr", "cal")
Return
Return

#IfWinActive, .*jopim@.*
    #'::Send !{Space}n
    F1::TerminalPanes("", "rr", "cal")
    !F1::Send stack{space}ghci{enter}
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
    F1::Run, % ONEDRIVE_UEF . "Fiji.app\ImageJ.pdf"
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

#IfWinActive, ahk_exe Spotify.exe
^l::
    Send ^l
    Sleep 50
    Send ^a
Return
^f::
    Send ^f
    Sleep 50
    Send ^a
Return
Return

#IfWinActive, ahk_exe MTexturedStyleEditor.exe
    F1::Run, % ACCESSORIES . "REAPER\MTexturedStyleEditor\MTexturedStyleEditor.pdf"
Return

#IfWinActive, ahk_exe Cubase11.exe
    F1::Run, "https://steinberg.help/cubase_pro/v11/en/cubase_nuendo/topics/chord_pads/chord_pad_zone_r.html"
Return

#IfWinActive, ahk_exe Falconx64.exe
    F1::Run, % ACCESSORIES . "REAPER Iapetus\Guide.pdf"
Return

#IfWinActive, ahk_exe FL64.exe
    F2::Send {F7}
    F3::Send {F6}
    F4::Send {F5}
    F5::Send {F9}
    !SC029::Send {F9}
    ^f::Send {F8}
    ^1::Send !{F8}
Return

#IfWinActive, ahk_exe wsl.exe
    ^q::Send {U+003A}q{Enter}
Return

; ============================================================================
; GAMES
; ============================================================================
#IfWinActive, Minecraft 1.*
    ; https://minecraft.fandom.com/wiki/Commands
    !F1::EnterCommand("/time set day", "t")
    !F2::EnterCommand("/time set night", "t")
    !F3::EnterCommand("/weather clear", "t")
    !F4::EnterCommand("/weather thunder", "t")
Return

#IfWinActive, ahk_exe hl2.exe
    ^q::Send {Delete}
Return

#IfWinActive, BallisticNG
!F1::
    BALLISTICNG_MENU_SEQUENCE := ["{Left}","{Left}","{Up}","{Up}","{Enter}","{Right}","{Up}","{Up}","{Enter}","{Esc}","{Right}","{Right}","{Down}","{Down}","{Enter}","{Enter}","{Enter}"]
    For i, key in BALLISTICNG_MENU_SEQUENCE {
        Send % key
        Sleep 250
    }
Return
Return

; ============================================================================
; FUNCTIONS
; ============================================================================
ShutDownDialog() {
    MsgBox, 0x202, Power, % GetOutput("cat " A_ScriptFullPath " | Select-String '^!#F'") "What to do with uptime?"
    IfMsgBox Abort
    Run, shutdown /s /t 0
    else IfMsgBox Retry
        Run, shutdown /r /t 0
Return
}

EnterCommand(entry, invoke_key, escape = True, select = False, enter = True, interval = 50) {
    Send %invoke_key%
    if (select)
        Send ^a
    Sleep %interval%
    Send %entry%
    if (enter) {
        Sleep %interval%
        Send {Enter}
    }
    if (escape) {
        Sleep %interval%
        Send {Esc}
    }
}

DuckDuckGoSearch(entry) {
    entry := % "{!}" . entry . " "
    EnterCommand(entry, "^l", False, False, False)
}

TerminalPanes(main_entry = "", ur_entry = "", lr_entry = "", interval = 500) {
    Sleep %interval%
    Send ^d
    Sleep %interval%
    if (ur_entry != "")
        Send %ur_entry%{Enter}
    Send +^d
    Sleep %interval%
    if (lr_entry != "")
        Send %lr_entry%{Enter}
    Send +!{right}
    Send !{left}
    if (main_entry != "") 
        Send %main_entry%{Enter}
}

GetOutput(command) {
    shell := ComObjCreate("WScript.Shell")
    exec := shell.Exec(ComSpec " /C " command)
    exec := shell.Exec("powershell " command)
return exec.StdOut.ReadAll()
}

; Init(user) {
Init() {
    global
    ROAMING := "C:\Users\" . USER . "\AppData\Roaming\"
    START_MENU_USER := ROAMING . "Microsoft\Windows\Start Menu\Programs\"
    START_MENU := "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"
    ONEDRIVE := "D:\OneDrive\"
    ACCESSORIES := ONEDRIVE . "Accessories\"
    ONEDRIVE_UEF := "D:\OneDrive - University of Eastern Finland\"
    RESEARCH_GROUP := ONEDRIVE_UEF . "Publications - Research Group\"
    CREATIVE_CLOUD := "D:\Creative Cloud Files\"
    CODE := START_MENU_USER . "Visual Studio Code\Visual Studio Code.lnk """
}