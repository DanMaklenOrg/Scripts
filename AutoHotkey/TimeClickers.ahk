#Requires AutoHotkey v2.0
; This script is intended to for Cube Farming.
;  - Upgrade the everything (weapons, team and ability)
;  - Will keep using the abilities on cooldown
;  - Activate auto aim
;  - Will auto click
;  - Will place the mouse to pick up rainbow balls
;  - After a configured period of time it will restart the run

+Pause:: ExitApp ; Failsaif to immidately terminate the script
Pause:: Reload

global RunDuration := 600000 ; 1min = 60000 ; 2min = 120000 ; 5min = 300000 ; 10min = 600000 ; 15min = 900000 ; 30min = 1800000 ; 1hour = 3600000 ; 1.5hour = 5400000; 2hour = 7200000

; ----- Script Start -----
F9:: {
    WinActivate "Time Clickers"
    ; SetTimer EndCurrentRun, RunDuration
    loop {
        InitializeRun()
        loop {
            ; UpgradeTeam()
            UseAllAbilities()
            FireClickers()
        } until EndRun
        ; ResetRun()
    }
}
; Click, 0, 7 Only
F10:: {
    loop {
        UseAllAbilities()
        FireClickers(lockPosition := false)
    }
}

EndCurrentRun() {
    OutputDebug "Ending Current Run!"
    global EndRun := true
}
ResetRun() {
    Click 1215, 315
    Sleep 100
    Click 550, 515
    Sleep 1000
    Click 1130, 350
    Sleep 5000
}
InitializeRun() {
    MaxBulletUpgrades()
    UnlockAllAbilities()
    UpgradeTeam(sleepDuration := 50)
    loop 34*2 {
        UpgradeTeam()
    }
    EnableAutoAim()
    UseAllAbilities(all := true)
    global EndRun := false
}
SingleGameLoop() {
    UpgradeTeam()
    UseAllAbilities()
    FireClickers()
}

MaxBulletUpgrades() {
    loop 13 {
        Send 'h'
        Sleep 50
    }
}
UnlockAllAbilities() {
    loop 10 {
        Send 'c'
        Sleep 50
    }
}
UpgradeTeam(sleepDuration := 5) {
    Send 'a'
    Sleep sleepDuration
    Send 's'
    Sleep sleepDuration
    Send 'd'
    Sleep sleepDuration
    Send 'f'
    Sleep sleepDuration
    Send 'g'
    Sleep sleepDuration
}
UseAllAbilities(all := false) {
    if(all)
        Send ' 70'
    else 
        Send '70'
}
EnableAutoAim() {
    Send 'q'
    Sleep 50
    Send 'w'
    Sleep 50
    Send 'e'
    Sleep 50
}
FireClickers(lockPosition := true) {
    if(lockPosition) 
        Click 820, 130
    else
        Click
    Sleep 1
}
