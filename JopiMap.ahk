; https://www.autohotkey.com/docs/KeyList.htm

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, RegEx
; #Warn  			; Debug messages

EnvGet, COMPNAME, COMPUTERNAME
EnvGet, USER, USERNAME

; =============================================================================
; VARIABLES
; =============================================================================
; https://duckduckgo.com/bang
DUCKDUCKGO_BANGS := ["yt", "gm", "dis", "amg", "w", "rw", "tw", "gt", "forvo"]
DUCKDUCKGO_BANGS[10] := "i"

TERMINAL_CMD_INTERVAL = 500
FALCON_PROGRAM := "Acoustic Grand Piano"
VIRTUAL_MACHINE := "Arch"
POSTMAN_ADDRESSES := [""
, "localhost:8000"
, "localhost:8080"
, "www.ampparit.com"
, "www.thurrott.com"
, ""]

ONEDRIVE := "D:\OneDrive\"
ONEDRIVE_UEF := "D:\OneDrive - University of Eastern Finland\"
CREATIVE_CLOUD := "D:\Creative Cloud Files\"
ACCESSORIES := ONEDRIVE . "Accessories\"
LOCAL_MUSIC := "D:\OneDrive\Music\Audio\"
STEAM := "C:\Program Files (x86)\Steam\steam.exe"
ROAMING := "C:\Users\" . USER . "\AppData\Roaming\"
START_MENU_USER := ROAMING . "Microsoft\Windows\Start Menu\Programs\"
START_MENU := "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"

; =============================================================================
; TEMPORARY SHORTCUTS (WIPs, learning, evaluation)
; =============================================================================

!#F1::Run
, % ONEDRIVE_UEF . "Publications - Research Group\Kashyap 2021\Illustrations\"
!#F2::Run
, % ""
!#F3::Run
, % ""
!#F4::Run
, % ""
!#F5::Run
, % START_MENU_USER . "Obsidian.lnk"
!#F6::Run
, % ""
!#F7::Run
, % ""
!#F8::Run
, % STEAM . " -applaunch 383870" ; Firewatch
!#F9::Run
, % STEAM . " -applaunch 280" ; Half-Life
!#F10::Run
, % STEAM . " -applaunch 220" ; Half-Life 2
!#F11::Run
, % ""
!#F12::Run
, % STEAM . " -applaunch 420" ; Half-Life 2 Episode 2

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

+^#F4::Run, % START_MENU_USER . "Postman\Postman.lnk"
; ^!#F4::
; Run, cmd.exe /c cd /d "D:\OneDrive\React\react-test\" && npm start,,
; Run, cmd.exe /c code "D:\OneDrive\React\react-test\",, hide
; Return

#F5::Run, % START_MENU . "Visual Studio 2019.lnk"
+#F5::Run, % START_MENU . "Visual Studio Installer.lnk"
+^#F5::Run, % START_MENU . "Word.lnk"
+!#F5::Run, % START_MENU . "Excel.lnk"
^!#F5::Run, % ACCESSORIES . "Peripherals\HScrollFun.lnk"
+^!#F5::Run, % ACCESSORIES . "Office\JopiTemplate.potx"

#F6::Run, % ACCESSORIES . "RapidComposer\RapidComposer Template.rcCOMP"
+#F6::Run, % ACCESSORIES . "REAPER\REAPER.bat"
+^#F6::Run, % ACCESSORIES . "Steinberg\Project Templates\Jopi.cpr"
^!#F6::Run, % START_MENU . "Renoise 3.3.2 (x64)\Renoise 3.3.2 (x64).lnk"
+^!#F6::Run, % START_MENU_USER . "Image-Line\FL Studio 20.lnk"

#F7::
    if (COMPNAME = "IAPETUS") {
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
+^#F7::Run, % START_MENU . "Adobe Audition 2021.lnk"
+!#F7::Run, % ONEDRIVE . "Music\Falcon\" . FALCON_PROGRAM . ".uvip"
; , % ACCESSORIES . "TouchOSC\TouchOSCEditor.exe"
; , % ACCESSORIES . "REAPER\MTexturedStyleEditor\MTexturedStyleEditor.exe"
+^!#F7::Run, % START_MENU . "iLok License Manager.lnk"

#F8::Run, % START_MENU . "Adobe Lightroom.lnk"
+#F8::Run, % ACCESSORIES . "Foobar2000\foobar2000.exe"
+^!#F8::Run, fireface

#F9::Run, % START_MENU . "Steam\Steam.lnk"
; +#F9::Run
; , % STEAM . " -applaunch 108710" ; Alan Wake
; , % STEAM . " -applaunch 244210" ; Assetto Corsa
; , % STEAM . " -applaunch 870780" ; Control
; , % START_MENU . "Trend\EEP 14.0\EEP 14.0 (Petrol Design).lnk"
; , % STEAM . " -applaunch 383870" ; Firewatch
; , % STEAM . " -applaunch 2990" ; FlatOut 2
; , % STEAM . " -applaunch 280" ; Half-Life
; , % STEAM . " -applaunch 220" ; Half-Life 2
; , % STEAM . " -applaunch 380" ; Half-Life 2 Episode 1
; , % STEAM . " -applaunch 420" ; Half-Life 2 Episode 2
; , % STEAM . " -applaunch 976730" ; Halo
; , % STEAM . " -applaunch 12140" ; Max Payne
; , % STEAM . " -applaunch 12150" ; Max Payne 2
; , % START_MENU . "Minecraft Launcher\Minecraft Launcher.lnk"
; , % STEAM . " -applaunch 17410" ; Mirror's Edge
; , % STEAM . " -applaunch 620" ; Portal 2
; , % STEAM . " -applaunch 474960" ; Quantum Break
; , % STEAM . " -applaunch 1282590" ; Train Sim World 2
; , % STEAM . " -applaunch 269950" ; X-Plane
+^#F9::Run
, % STEAM . " -applaunch 473770" ; BallisticNG
+!#F9::Run
, "D:\SteamLibrary\steamapps\common\Quake\quakespasm.lnk" +map e1m5
^!#F9::Run
, % STEAM . " -applaunch 284160" ; BeamNG
+^!#F9::Run
, % START_MENU_USER . "Live for Speed\LFS.lnk" ; Live for Speed

#F10::Run, % ONEDRIVE . "Documents\Budget.xlsx"
+#F10::Run, % START_MENU_USER . "Microsoft Teams.lnk"
+^#F10::Run, % ONEDRIVE_UEF . "Introduction to Open Data Science\IODS-project\IODS-project.Rproj"
+!#F10::Run, % ONEDRIVE_UEF . "Fiji.app\Imagej-win64.exe"
+^!#F10::Run, % ONEDRIVE . "Jopi.mlx"

#F11::Run, colorcpl.exe
+#F11::
    if (COMPNAME = "SATURN") {
        Run, % ACCESSORIES . "BackupToW.bat"
    }
Return
; +^#F11::Run, % START_MENU . "VMware\VMware Workstation 16 Player.lnk -X ""C:\Users\" . USER . "\Documents\Virtual Machines\" . VIRTUAL_MACHINE . "\" . VIRTUAL_MACHINE . ".vmx"""
+!#F11::Run, % ACCESSORIES . "PeaZip\peazip.exe"
+^!#F11::Run, % START_MENU . "Microsoft Edge.lnk www.retrogames.cc/user/favorite-game.html"

; +^#Up::Send {AppsKey}
+^#Down::Send {Media_Play_Pause}
+^#Left::Send {Media_Prev}
+^#Right::Send {Media_Next}

ShutDownDialog() {
    MsgBox, 0x202, Power, What to do with uptime? ; 0 = OK, 1 = OK/Cancel, 3 = Yes/No/Cancel
    IfMsgBox Abort
    Run, shutdown /s /t 0
    else IfMsgBox Retry
        Run, shutdown /r /t 0
Return
}

#F12::ShutDownDialog()
+#F12::Run, cmd.exe /c code "D:\OneDrive\Accessories\JopiMap.ahk",, hide

; =============================================================================
; PROGRAM-SPECIFIC SHORTCUTS
; =============================================================================
DuckDuckGoSearch(entry) {
    entry := % "{!}" . entry . " "
    EnterCommand(entry, "^l", False, False, False)
}

#IfWinActive, ahk_exe msedge.exe
    !1::+!b 		; Focus Bookmarks bar
    !2::Send {F6}
!3::
    Send !f
    Sleep 50
    Send e
Return
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

PostmanAddress(entry, exec = False) {
    entry := % "https://" . entry . "/"
    if (exec) {
        interval = 500
    } else {
        interval = 50
    }
    EnterCommand(entry, "^l", False, True, exec, interval)
    ; Send ^l
    ; Send ^a
    ; Send https://%entry%/
    ; if (exec)
    ;     Send {Enter}
}
#IfWinActive, Postman
    F1::PostmanAddress(POSTMAN_ADDRESSES[2])
    !F1::PostmanAddress(POSTMAN_ADDRESSES[2], True)
    F2::PostmanAddress(POSTMAN_ADDRESSES[3])
    !F2::PostmanAddress(POSTMAN_ADDRESSES[3], True)
    F3::PostmanAddress(POSTMAN_ADDRESSES[4])
    !F3::PostmanAddress(POSTMAN_ADDRESSES[4], True)
    F4::PostmanAddress(POSTMAN_ADDRESSES[5])
    !F4::PostmanAddress(POSTMAN_ADDRESSES[5], True)
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

; ============================================================================
; GAMES
; ============================================================================
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

#IfWinActive, Minecraft 1.*
    ; https://minecraft.fandom.com/wiki/Commands
    !F1::EnterCommand("/time set day", "t")
    !F2::EnterCommand("/time set night", "t")
    !F3::EnterCommand("/weather clear", "t")
    !F4::EnterCommand("/weather thunder", "t")
Return

#IfWinActive, ahk_exe hl2.exe
    ^q::Send {Delete}
    ; https://gamefaqs.gamespot.com/pc/914642-half-life-2/cheats
    F1::EnterCommand("noclip", "{Esc}")
    F2::EnterCommand("impulse 101", "{Esc}")
    F3::EnterCommand("god", "{Esc}")
    F5::EnterCommand("host_timescale 0.5", "{Esc}")
    F6::EnterCommand("host_timescale 1", "{Esc}")
    F7::EnterCommand("host_timescale 1.5", "{Esc}")
    F8::EnterCommand("host_timescale 2", "{Esc}")
    ; https://wiki.sourceruns.org/wiki/Half-Life_Maps
    ::blastpit::map c1a4
    ::rocket::map c2a2h
    ::questionableethics::map c2a4d
    ::surfacetension::map c2a5
    ::xen::map c4a1
    ; https://developer.valvesoftware.com/wiki/Half-Life_2_map_reference
    ::manhacks::map d1_canals_03
    ::airboat::map d1_canals_06
    ::helicopter::map d1_canals_13
    ::town::map d1_town_01
    ::townexit::map d1_town_05
    ::bridge::map d2_coast_07
    ::lighthouse::map d2_coast_10
    ::prison::map d2_prison_02
    ::teleport::map d2_prison_08
    ::anticitizen::map d3_c17_02
    ::warehouse::map d3_c17_08
    ::striders::map d3_c17_12b
    ::citadel::map d3_citadel_01
    ; https://steamcommunity.com/sharedfiles/filedetails/?id=1330337329
    ::reactor::map ep1_citadel_03
    ::urbanflight::map ep1_c17_01
    ::exit17::map ep1_c17_05
    ; https://wiki.sourceruns.org/wiki/Half-Life_2:_Episode_Two_Maps
    ::pontifex::map ep2_outland_05
    ::riding::map ep2_outland_06a
    ::helibombs::map ep2_outland_08
    ::valleybattle::map ep2_outland_12
Return

#IfWinActive, ahk_exe quakespasm.exe
    ; https://quake.fandom.com/wiki/Console_Commands_(Q1)
    F1::EnterCommand("noclip", "§")
    F2::EnterCommand("impulse 9", "§")
    F3::EnterCommand("impulse 255", "§")
    F12::EnterCommand("map ", "§", False, False, False)
Return

#IfWinActive, BallisticNG
!F1::
    BALLISTICNG_MENU_SEQUENCE := ["{Left}","{Left}","{Up}","{Up}","{Enter}","{Right}","{Up}","{Up}","{Enter}","{Esc}","{Right}","{Right}","{Down}","{Down}","{Enter}","{Enter}","{Enter}"]
    For i, key in BALLISTICNG_MENU_SEQUENCE {
        Send % key
        Sleep 200
    }
Return
Return

#IfWinActive, ahk_exe maxpayne.exe
    ; https://steamcommunity.com/sharedfiles/filedetails/?id=2022465230
F1::
    Loop, 30
        Send {Home}
    Sleep 10
Return
F2::
    Loop, 30
        Send {End}
    Sleep 10
Return
; http://legacy.3drealms.com/max/walkthrough/p1c1.html
; https://maxpayne.fandom.com/wiki/Max_Payne_(Game)#Chapters
:*SEk1:hotel::maxpay`t->gm_in`tpart1_level2
:*SEk1:docks::maxpay`t->gm_in`tpart2_level2
:*SEk1:foundry::maxpay`t->gm_in`tpart3_level2
:*SEk1:parking::maxpay`t->gm_in`tpart3_level4
:*SEk1:manor::maxpay`t->gm_in`tpart3_level5
:*SEk1:aesir::maxpay`t->gm_in`tpart3_level6
Return
