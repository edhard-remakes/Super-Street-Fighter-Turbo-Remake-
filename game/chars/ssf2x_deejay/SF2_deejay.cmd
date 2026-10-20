;SF2_DJ 1220    1320    1000 1020
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 
;-| AI |--------------------------------------------------------FIDO A
[Command]
name = "ai"
command = F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai1"
command = F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai2"
command = F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai3"
command = F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai4"
command = F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai5"
command = x,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai6"
command = x,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai7"
command = x,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai8"
command = y,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai9"
command = y,y,y,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai10"
command =  y,y,F,F,F,y,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai11"
command = F,F,x,z,a,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai12"
command = a,F,F,F,x,F,F,F,b,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai13"
command = b,b,b,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai14"
command = F,F,b,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai15"
command = F,b,F,F,b,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai16"
command = F,F,c,c,c,F,F,F,F,F,F,F,c,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai17"
command = c,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,c,c,F,a+b
time = 1
[Command]
name = "ai18"
command = F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,c,F,F,F,F,F,F,F,c,c,a+b
time = 1
[Command]
name = "ai19"
command = c,F,F,z,F,F,a,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai20"
command = c,F,F,F,F,b,F,F,F,F,a,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai21"
command = a,F,F,F,F,F,F,z,F,F,F,F,F,b,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai22"
command = b,a,z,x,c,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai23"
command = x,c,x,x,x,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai24"
command = x,x,x,z,z,z,z,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai25"
command = z,z,z,z,z,z,z,z,a,a,a,a,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai26"
command = a,a,a,a,a,a,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai27"
command = a,a,a,F,F,F,F,F,a,a,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai28"
command = a+b,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1
[Command]
name = "ai29"
command =  z+b,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,a+b
time = 1

;--------------------------------------------------------------------------
;HYPER
[Command]
Name = "super_01A"
command = ~50$B, F, B, F, a
Time = 40
[Command]
Name = "super_01A"
command = ~50$B, F, B, F, b
Time = 40
[Command]
Name = "super_01A"
command = ~50$B, F, B, F, c
Time = 40

[Command]
Name = "super_02A"
command = ~50$B, F, B, F, x
Time = 40
[Command]
Name = "super_02A"
command = ~50$B, F, B, F, y
Time = 40
[Command]
Name = "super_02A"
command = ~50$B, F, B, F, z
Time = 40

;--------------------------------------------------------------------------
[Command]
Name = "x,x,x"
Command = x,x
Time = 15
[Command]
Name = "x,x,x"
Command = y,y
Time = 15
[Command]
Name = "x,x,x"
Command = z,z
Time = 15

;--------------------------------------------------------------------------
;SPECIAL_04A
[Command]
name = "special_04A"
command = ~50$D, U, a
time = 15

;SPECIAL_04B
[Command]
name = "special_04B"
command = ~50$D, U, b
time = 15

;SPECIAL_04C
[Command]
name = "special_04C"
command = ~50$D, U, c
time = 15

;--------------------------------------------------------------------------
;SPECIAL_05A
[Command]
name = "special_05A"
command = ~50$D, U, x
time = 15

;SPECIAL_05B
[Command]
name = "special_05B"
command = ~50$D, U, y
time = 15

;SPECIAL_05C
[Command]
name = "special_05C"
command = ~50$D, U, z
time = 15

;--------------------------------------------------------------------------
;SPECIAL_01A
[Command]
name = "special_01A"
command = ~50$B, F, x
time = 15

;SPECIAL_01B
[Command]
name = "special_01B"
command = ~50$B, F, y
time = 15

;SPECIAL_01C
[Command]
name = "special_01C"
command = ~50$B, F, z
time = 15

;--------------------------------------------------------------------------
;SPECIAL_03A
[Command]
name = "special_03A"
command = ~50$B, F, a
time = 15

;SPECIAL_01B
[Command]
name = "special_03B"
command = ~50$B, F, b
time = 15

;SPECIAL_01C
[Command]
name = "special_03C"
command = ~50$B, F, c
time = 15


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "rolling"
command = x+a
time = 1

[Command]
name = "recovery"			;Required (do not remove)
command = x+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "throw_01F"
command = /$F,y
time = 1
[Command]
name = "throw_01B"
command = /$B,y
time = 1

[Command]
name = "throw_02F"
command = /$F,z
time = 1
[Command]
name = "throw_02B"
command = /$B,z
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "up"
command = U
time = 1

[Command]
name = "down"
command = D
time = 1

[Command]
name = "fwd"
command = F
time = 1

[Command]
name = "back"
command = B
time = 1

[Command]
name = "upback"
command = UB
time = 1

[Command]
name = "downback"
command = DB
time = 1

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 2

[Command]
name = "hold_y"
command = /y
time = 2

[Command]
name = "hold_z"
command = /z
time = 2

[Command]
name = "hold_a"
command = /a
time = 2

[Command]
name = "hold_b"
command = /b
time = 2

[Command]
name = "hold_c"
command = /c
time = 2

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd"				;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback"				;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" 				;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown"				;Required (do not remove)
command = /$D
time = 1

[Command]
name = "block_air"
command = ~$D~
time = 1

[Command]
name = "block_air"
command = ~$F~
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]
;AI
[State -1, SF2 training legacy AI reset]
type = VarSet
trigger1 = gamemode = "training" && map(_iksys_trainingDummyControl) != 1
v = 25
value = 0
ignorehitpause = 1

[State -1]
type = VarSet
triggerall = gamemode != "training" || map(_iksys_trainingDummyControl) = 1

trigger1 = Command = "ai"
trigger2 = Command = "ai1"
trigger3 = Command = "ai2"
trigger4 = Command = "ai3"
trigger5 = Command = "ai4"
trigger6 = Command = "ai5"
trigger7 = Command = "ai6"
trigger8 = Command = "ai7"
trigger9 = Command = "ai8"
trigger10 = Command = "ai9"
trigger11 = Command = "ai10"
trigger12 = Command = "ai11"
trigger13 = Command = "ai12"
trigger14 = Command = "ai13"
trigger15 = Command = "ai14"
trigger16 = Command = "ai15"
trigger17 = Command = "ai16"
trigger18 = Command = "ai17"
trigger19 = Command = "ai18"
trigger20 = Command = "ai19"
trigger21 = Command = "ai20"
trigger22 = Command = "ai21"
trigger23 = Command = "ai22"
trigger24 = Command = "ai23"
trigger25 = Command = "ai24"
trigger26 = Command = "ai25"
trigger27 = Command = "ai26"
trigger28 = Command = "ai27"
trigger29 = Command = "ai28"
trigger30 = Command = "ai29"
ignorehitpause = 1
var(25) = 1

;AI
[State -1, SF2 training legacy AI reset]
type = VarSet
trigger1 = gamemode = "training" && map(_iksys_trainingDummyControl) != 1
v = 26
value = 0
ignorehitpause = 1

[State -1]
type = VarSet
triggerall = gamemode != "training" || map(_iksys_trainingDummyControl) = 1

trigger1 = Command = "ai"
trigger2 = Command = "ai1"
trigger3 = Command = "ai2"
trigger4 = Command = "ai3"
trigger5 = Command = "ai4"
trigger6 = Command = "ai5"
trigger7 = Command = "ai6"
trigger8 = Command = "ai7"
trigger9 = Command = "ai8"
trigger10 = Command = "ai9"
trigger11 = Command = "ai10"
trigger12 = Command = "ai11"
trigger13 = Command = "ai12"
trigger14 = Command = "ai13"
trigger15 = Command = "ai14"
trigger16 = Command = "ai15"
trigger17 = Command = "ai16"
trigger18 = Command = "ai17"
trigger19 = Command = "ai18"
trigger20 = Command = "ai19"
trigger21 = Command = "ai20"
trigger22 = Command = "ai21"
trigger23 = Command = "ai22"
trigger24 = Command = "ai23"
trigger25 = Command = "ai24"
trigger26 = Command = "ai25"
trigger27 = Command = "ai26"
trigger28 = Command = "ai27"
trigger29 = Command = "ai28"
trigger30 = Command = "ai29"
ignorehitpause = 1
var(26) = 1

;==========================================================================================
;--------------------------------------------------------------------------
;HYPER

;==========================================================================================
;--------------------------------------------------------------------------
;SUPER
[State -1, 2000]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = power >= 3000 ; Universal full-meter super requirement
value = 2000
trigger1 = command = "super_01A" &&  statetype != A && ctrl && Power >= 3000
trigger2 = command = "super_01A" &&  statetype != A && movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

[State -1, 2000] ;AIAIAI
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = power >= 3000 ; Universal full-meter super requirement
value = 2000
triggerall = var(25) = 1 &&  statetype != A && ctrl && Power >= 3000 && P2statetype != L && movetype != H
trigger1 = movehit && ( stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320 )

;SUPER
[State -1, 2100]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = power >= 3000 ; Universal full-meter super requirement
value = 2100
triggerall = var(14) = 1
triggerall = command = "super_02A" &&  statetype != A && Power >= 3000
trigger1 = stateno = 40 || ctrl = 1
trigger2 = command = "super_02A" &&  statetype != A && movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;==========================================================================================
;--------------------------------------------------------------------------
;SPECIAL
;SPECIAL_01_A
[State -1, 1000]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1000
trigger1 = command = "special_01A" &&  statetype != A && ctrl && NumProj = 0
trigger2 = command = "special_01A" &&  statetype != A && NumProj = 0 && movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_01_A AIAIAI
[State -1, 1000]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1000
triggerall  = var(25) = 1 &&  statetype != A && NumProj = 0 && P2statetype != L && movetype != H
trigger1 = P2bodydist X <= 200 && ctrl && random <= 40
trigger2 = movecontact && ( stateno = 205 || stateno = 330 )

;SPECIAL_01_B
[State -1, 1010]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1010
trigger1 = command = "special_01B" &&  statetype != A && ctrl && NumProj = 0
trigger2 = command = "special_01B" &&  statetype != A && NumProj = 0 && movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_01_C
[State -1, 1020]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1020
trigger1 = command = "special_01C" &&  statetype != A && ctrl && NumProj = 0
trigger2 = command = "special_01C" &&  statetype != A && NumProj = 0 && movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_01_C AIAIAI
[State -1, 1020]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1020
triggerall =  var(25) = 1 &&  statetype != A && NumProj = 0 && P2statetype != L && movetype != H
trigger1 = P2bodydist X <= 200 && ctrl && random <= 40
trigger2 = movecontact && ( stateno = 205 || stateno = 330 )
;
trigger3 = ctrl && P2name ="ryu"&& (P2stateno=1100||P2stateno=1110||P2stateno=1120||P2stateno=1000||P2stateno=1010||P2stateno=1020)
trigger4 = ctrl &&  P2name ="ken"&& ( P2stateno=1100||P2stateno=1110||P2stateno=1120 )
trigger5 = ctrl && P2name ="chunli"&&(P2stateno=1200||P2stateno=1201||P2stateno=1202)
trigger6 = ctrl && P2name ="guile"&&(P2stateno=1000||P2stateno=1010||stateno=1020)
trigger7 = ctrl && P2name ="dhalsim"&&(P2stateno=1000||P2stateno=1010||P2stateno=1020)
trigger8 = ctrl && P2name ="deejay"&&(P2stateno=1000||P2stateno=1010||P2stateno=1020)
trigger9 = ctrl && P2name ="sagat"&&(P2stateno=1100||P2stateno=1110||P2stateno=1120||P2stateno=1000||P2stateno=1010||P2stateno=1020)

;--------------------------------------------------------------------------
;SPECIAL
;SPECIAL_03_A
[State -1, 1200]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1200
trigger1 = command = "special_03A" &&  statetype != A && ctrl 
trigger2 = command = "special_03A" &&  statetype != A && movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_03_B
[State -1, 1210]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1210
trigger1 = command = "special_03B" &&  statetype != A && ctrl 
trigger2 = command = "special_03B" &&  statetype != A && movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_03_C
[State -1, 1220]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1220
trigger1 = command = "special_03C" &&  statetype != A && ctrl 
trigger2 = command = "special_03C" &&  statetype != A && movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_03_C AIAIAI
[State -1, 1220]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1220
triggerall = var(25) = 1 &&  statetype != A && P2statetype != L && movetype != H
trigger1 = P2bodydist X <= 200 && ctrl && random <= 40
trigger2 = movecontact && ( stateno = 205 || stateno = 330 )

;--------------------------------------------------------------------------
;SPECIAL
;SPECIAL_04_A
[State -1, 1200]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1300
triggerall = command = "special_04A" &&  statetype != A  
trigger1 = ctrl || stateno = 40
trigger2 = movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_04_B
[State -1, 1210]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1310
triggerall = command = "special_04B" &&  statetype != A  
trigger1 = ctrl || stateno = 40
trigger2 = movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_04_C
[State -1, 1220]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1320
triggerall = command = "special_04C" &&  statetype != A  
trigger1 = ctrl || stateno = 40
trigger2 = movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_04_C AIAIAI
[State -1, 1220]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1320
triggerall = var(25) = 1 &&  statetype != A  && P2statetype != L && movetype != H
trigger1 = P2bodydist X <= 30 && P2statetype = A && random <= 100 && ctrl
trigger2 = movehit && random <= 10
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;--------------------------------------------------------------------------
;SPECIAL
;SPECIAL_05_A
[State -1, 1200]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1400
triggerall = command = "special_05A" &&  statetype != A  
trigger1 = ctrl || stateno = 40
trigger2 = movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_05_B
[State -1, 1210]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1400
triggerall = command = "special_05B" &&  statetype != A  
trigger1 = ctrl || stateno = 40
trigger2 = movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;SPECIAL_05_C
[State -1, 1220]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1400
triggerall = command = "special_05C" &&  statetype != A  
trigger1 = ctrl || stateno = 40
trigger2 = movecontact
trigger2 = stateno=200||stateno=205||stateno=220||stateno=240||stateno=245||stateno=260||stateno=300||stateno=310||stateno=320

;--------------------------------------------------------------------------
;SPECIAL_05_A

;--------------------------------------------------------------------------
;SPECIAL_06_A

;--------------------------------------------------------------------------
;SPECIAL_07_A
;-----------------------------------------------------------------------------------------------------------------------------------
;EX and NORMAL change state
[State -1, 14444]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 14444
triggerall = var(25) = 0
trigger1 = command = "b" &&  command = "y" && ctrl && statetype != A && var(14) = 0

[State -1, 44444]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 44444
trigger1 = command = "b" &&  command = "y" && ctrl && statetype != A && var(14) = 1
;==========================================================================================
; Basic Throws
[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 500
triggerall = statetype = S && ctrl && stateno != 100
trigger1 = command = "holdback" && command = "b" 
trigger1 = p2bodydist X < 25

[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 510
triggerall = statetype = S && ctrl && stateno != 100
trigger1 = command = "holdback" && command = "c" 
trigger1 = p2bodydist X < 25

[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 520
triggerall = statetype = S && ctrl && stateno != 100
trigger1 = command = "holdfwd" && command = "b" 
trigger1 = p2bodydist X < 25

[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 530
triggerall = statetype = S && ctrl && stateno != 100
trigger1 = command = "holdfwd" && command = "c" 
trigger1 = p2bodydist X < 25

[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 540
triggerall = statetype = S && ctrl && stateno != 100
trigger1 = command = "holdback" && command = "y" 
trigger1 = p2bodydist X < 25
[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 550
triggerall = statetype = S && ctrl && stateno != 100
trigger1 = command = "holdback" && command = "z" 
trigger1 = p2bodydist X < 25

[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 560
triggerall = statetype = S && ctrl && stateno != 100
trigger1 = command = "holdfwd" && command = "y" 
trigger1 = p2bodydist X < 25
[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 570
triggerall = statetype = S && ctrl && stateno != 100
trigger1 = command = "holdfwd" && command = "z" 
trigger1 = p2bodydist X < 25
;--------------------------------------------------------------------------
;basic PK
;F/B JUMP LIGHT K
[State -1, 355]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 356
triggerall = command = "a" && statetype = A && vel X != 0 && command = "holddown"
trigger1 = ctrl

;--------------------------------------------------------------------------
;C LP
[State -1, 300]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 300
triggerall = command = "x" && command = "holddown" &&  statetype = C
trigger1 = ctrl
trigger2 = stateno = 300 && MoveContact

;C MP
[State -1, 305]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 305
triggerall = command = "y" && command = "holddown" &&  statetype = C
trigger1 = ctrl

;C HP
[State -1, 310]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 310
triggerall = command = "z" && command = "holddown" &&  statetype = C
trigger1 = ctrl

;C HP AIAIAI
[State -1, 310]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 310
triggerall = var(25) = 1 && p2bodydist X <= 30 && statetype != A && P2statetype !=L && movetype != H
trigger1 = ctrl && P2statetype = A && random <= 30
trigger2 = movecontact && stateno = 300

;C LK
[State -1, 320]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 320
triggerall = command = "a" && command = "holddown" &&  statetype = C
trigger1 = ctrl
trigger2 = stateno = 320 && ( MoveContact || time >= 9 )
trigger3 = stateno = 300 && movecontact

;C MK
[State -1, 325]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 325
triggerall = command = "b" && command = "holddown" &&  statetype = C
trigger1 = ctrl

;C HK
[State -1, 330]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 330
triggerall = command = "c" && command = "holddown" &&  statetype = C
trigger1 = ctrl

;C HK AIAIAI
[State -1, 330]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 330
triggerall = var(25) = 1 && p2bodydist X <= 20 && statetype != A && P2statetype !=L && movetype != H
trigger1 = ctrl && P2statetype = A && random <= 30

;--------------------------------------------------------------------------
;NEAR STAND LP
[State -1, 200]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 200
triggerall = command = "x" && command != "holddown" && p2bodydist X <= 25 && statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact

;NEAR STAND MP
[State -1, 205]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 205
triggerall = command = "y" && command != "holddown" && p2bodydist X <= 25 && statetype = S
trigger1 = ctrl

;NEAR STAND MP AIAIAI
[State -1, 205]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 205
triggerall = var(25) = 1 && p2bodydist X <= 25 && statetype != A && P2statetype !=L && movetype != H
trigger1 = ctrl && P2statetype != A && random <= 40

;NEAR STAND HP
[State -1, 210]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 210
triggerall = command = "z" && command != "holddown" && p2bodydist X <= 25 && statetype = S
trigger1 = ctrl

;NEAR STAND LK
[State -1, 220]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 220
triggerall = command = "a" && command != "holddown" && p2bodydist X <= 25 && statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact

;NEAR STAND MK
[State -1, 225]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 225
triggerall = command = "b" && command != "holddown" && p2bodydist X <= 25 && statetype = S
trigger1 = ctrl

;NEAR STAND HK
[State -1, 230]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 230
triggerall = command = "c" && command != "holddown" && p2bodydist X <= 25 && statetype = S
trigger1 = ctrl

;==========================================================================================
;FAR STAND
;FAR STAND LP
[State -1, 240]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 240
triggerall = command = "x" && command != "holddown" && p2bodydist X > 25 && statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 240 && ( time >= 9 || MoveContact)

;FAR STAND MP
[State -1, 245]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 245
triggerall = command = "y" && command != "holddown" && p2bodydist X > 25 && statetype = S
trigger1 = ctrl

;FAR STAND HP
[State -1, 250]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 250
triggerall = command = "z" && command != "holddown" && p2bodydist X > 25 && statetype = S
trigger1 = ctrl

;FAR STAND LK
[State -1, 260]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 260
triggerall = command = "a" && command != "holddown" && p2bodydist X > 25 && statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 260 && ( time >= 9 || MoveContact)

;FAR STAND MK
[State -1, 265]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 265
triggerall = command = "b" && command != "holddown" && p2bodydist X > 25 && statetype = S
trigger1 = ctrl

;FAR STAND HK
[State -1, 270]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 270
triggerall = command = "c" && command != "holddown" && p2bodydist X > 25 && statetype = S
trigger1 = ctrl

;FAR STAND HK AIAIAI
[State -1, 270]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 270
triggerall = var(25) = 1 && p2bodydist X > 25 && statetype != A && P2statetype !=L && movetype != H
trigger1 = ctrl && P2bodydist X<= 80 && P2statetype != A && random <= 50
trigger2 = P2movetype = H && P2bodydist X <= 100 && ctrl
;==========================================================================================
;F/B JUMP LIGHT PUNCH
[State -1, 340]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 340
triggerall = command = "x" && statetype = A && vel X != 0
trigger1 = ctrl

;F/B JUMP M PUNCH
[State -1, 345]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 345
triggerall = command = "y" && statetype = A && vel X != 0
trigger1 = ctrl

;F/B JUMP H PUNCH
[State -1, 350]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 350
triggerall = command = "z" && statetype = A && vel X != 0
trigger1 = ctrl

;F/B JUMP LIGHT K
[State -1, 355]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 355
triggerall = command = "a" && statetype = A && vel X != 0
trigger1 = ctrl

;F/B JUMP MK
[State -1, 360]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 360
triggerall = command = "b" && statetype = A && vel X != 0
trigger1 = ctrl

;F/B JUMP HK
[State -1, 365]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 365
triggerall = command = "c" && statetype = A && vel X != 0
trigger1 = ctrl


;==========================================================================================
;JUMP LIGHT PUNCH
[State -1, 370]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 370
triggerall = command = "x" && statetype = A && vel X = 0
trigger1 = ctrl

;JUMP M PUNCH
[State -1, 375]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 375
triggerall = command = "y" && statetype = A && vel X = 0
trigger1 = ctrl

; JUMP H PUNCH
[State -1, 380]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 380
triggerall = command = "z" && statetype = A && vel X = 0
trigger1 = ctrl

; JUMP LIGHT K
[State -1, 385]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 385
triggerall = command = "a" && statetype = A && vel X = 0
trigger1 = ctrl

; JUMP MK
[State -1, 390]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 390
triggerall = command = "b" && statetype = A && vel X = 0
trigger1 = ctrl

; JUMP HK
[State -1, 395]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 395
triggerall = command = "c" && statetype = A && vel X = 0
trigger1 = ctrl


;==========================================================================================
;==========================================================================================
[state -1,bak]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = var(25) = 1 && movetype != H && P2statetype != A && P2statetype != L && random <= 1 
triggerall = statetype != A && stateno != 40 && P2bodyDist X = [40,120]				
trigger1 = stateno = 140 && !MoveContact && P2movetype = A
value = 40

;==========================================================================================
;Auto Guard 一般要放在 state -1 的最上位置
[State -1, auto];這是用來控制人物蹲下擋的
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = P2stateno != 1301
triggerall = statetype != A && var(25) = 1 && movetype != H && ctrl = 1 && P2MoveType = A
triggerall = P2BodyDist X <= 200 && P2statetype = S			;距離彼近時
;
trigger1 = PrevStateNo != 151					;而之前又不是擋
trigger2 = PrevStateNo != 152
trigger3 = PrevStateNo != 153
value = 120							;就蹲下預備防禦

[State -1];這是用來控制人物蹲下擋的
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = P2stateno != 1301
triggerall = statetype != A && var(25) = 1 && movetype != H && ctrl = 1 && P2MoveType = A
triggerall = P2BodyDist X <= 300 && P2statetype = S 				;距離彼近時
;
trigger1 = P2name ="ryu"&& (P2stateno=1100||P2stateno=1110||P2stateno=1120||P2stateno=1000||P2stateno=1010||P2stateno=1020)
trigger2 = P2name ="ken"&& ( P2stateno=1100||P2stateno=1110||P2stateno=1120 )
trigger3 = P2name ="chunli"&&(P2stateno=1200||P2stateno=1201||P2stateno=1202)
trigger4 = P2name ="guile"&&(P2stateno=1000||P2stateno=1010||stateno=1020)
trigger5 = P2name ="dhalsim"&&(P2stateno=1000||P2stateno=1010||P2stateno=1020)
trigger6 = P2name ="deejay"&&(P2stateno=1000||P2stateno=1010||P2stateno=1020)
trigger7 = P2name ="sagat"&&(P2stateno=1100||P2stateno=1110||P2stateno=1120||P2stateno=1000||P2stateno=1010||P2stateno=1020)
;
value = 120

;walk AI
[state -1,walk]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = ctrl = 1 && movetype != H && P2movetype != A
trigger1 = P2bodyDist X = [30,150]						;通常會在要在目標位置加減 10-20 作為空間
trigger1 = Anim != 5
trigger1 = StateNo = 0
trigger1 = Pos Y = 0							;確保是在地上
trigger1 = P2movetype != A
value = 20

[state -1,bak]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = ctrl = 1 && movetype != H && P2movetype != A
trigger1 = P2bodyDist X = [151,200]					;通常會在要在目標位置加減 10-20 作為空間
trigger1 = Anim != 5
trigger1 = StateNo = 0
trigger1 = Pos Y = 0							;確保是在地上
value = 20
