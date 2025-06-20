#Requires AutoHotkey v2.0
; This script is intended to for achievements:
;   - Cave Crasher
; Leave an arcade game running in 5 or 15min on Easy difficutly.
; The script will keep the speed up running and will automatically retart the run.

+Pause:: ExitApp ; Failsaif to immidately terminate the script
Pause:: Reload

; ----- Script Start -----
F9:: {
    WinActivate "Dwarfs!"
    Send '{s down}'
    loop {
      Click 930, 660, 0
      Send '{LButton}'
    }
}

