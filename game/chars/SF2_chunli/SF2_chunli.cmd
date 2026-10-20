; The CMD file.chunli  
;1010 55555555
;1100 ()()()
;1200 ball 1202 5ball  2700
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
[Command]
Name = "super_01A"
command = ~50$B, F, B, F, a
Time = 30

[Command]
Name = "super_01A"
command = ~50$B, F, B, F, b
Time = 30

[Command]
Name = "super_01A"
command = ~50$B, F, B, F, c
Time = 30

;--------------------------------------------------------------------------
[Command]
Name = "super_02A"
command = ~50$B, F, B, F, x
Time = 30

[Command]
Name = "super_02A"
command = ~50$B, F, B, F, y
Time = 30

[Command]
Name = "super_02A"
command = ~50$B, F, B, F, z
Time = 30

;--------------------------------------------------------------------------
[Command]
Name = "special_01A"
Command = a,a,a
Time = 25

[Command]
Name = "special_01B"
Command = b,b,b
Time = 25

[Command]
Name = "special_01C"
command = c,c,c
Time = 30

[Command]
name = "special_02A"
command = ~50$B, F, a
time = 15

[Command]
name = "special_02B"
command = ~50$B, F, b
time = 15

[Command]
name = "special_02C"
command = ~50$B, F, c
time = 15

[Command]
name = "special_03A"
command = ~50$B, F, x
time = 15

[Command]
name = "special_03B"
command = ~50$B, F, y
time = 15

[Command]
name = "special_03C"
command = ~50$B, F, z
time = 15

[Command]
name = "special_04A"
command = ~50$D, U, a
time = 15

[Command]
name = "special_04B"
command = ~50$D, U, b
time = 15

[Command]
name = "special_04C"
command = ~50$D, U, c
time = 15

[Command]
name = "special_07A"
command = ~D, DB, B, a
time = 15

[Command]
name = "special_07B"
command = ~D, DB, B, b
time = 15

[Command]
name = "special_07C"
command = ~D, DB, B, c
time = 15

[Command]
name = "special_09A"
command = ~D, DB, B, x
time = 15

[Command]
name = "special_09B"
command = ~D, DB, B, y
time = 15

[Command]
name = "special_09C"
command = ~D, DB, B, z
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
name = "throw_01"
command = /$F,y
time = 1

[Command]
name = "throw_01"
command = /$F,z
time = 1

[Command]
name = "special_05A"
command = /$D,b
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
[State -1]
type = VarSet
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
var(25) = 0

;AI
[State -1]
type = VarSet
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


[State -1, tag]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 4510
triggerall = command = "c" && command = "z"
triggerall = Var(51) = 1
triggerall = partner, life > 0
triggerall = power >= 3000
trigger1 = (StateType != A) && (Ctrl = 1)
trigger2 = StateNo = 200
trigger2 = MoveContact
trigger2 = AnimElem = 4, < 0
trigger3 = StateNo = 210
trigger3 = MoveContact
trigger3 = AnimElem = 5, < 0
trigger4 = StateNo = 220
trigger4 = MoveContact
trigger4 = AnimElem = 7, < 0
trigger5 = StateNo = 240
trigger5 = MoveContact
trigger5 = AnimElem = 5, < 0
trigger6 = StateNo = 260
trigger6 = MoveContact
trigger6 = AnimElem = 7, < 0
trigger7 = StateNo = 300
trigger7 = MoveContact
trigger7 = AnimElem = 4, < 0
trigger8 = StateNo = 310
trigger8 = MoveContact
trigger8 = AnimElem = 7, < 0
trigger9 = StateNo = 320
trigger9 = MoveContact
trigger9 = AnimElem = 4, < 0
trigger10 = StateNo = 2240
trigger10 = MoveContact
trigger10 = AnimElem = 8, < 0

;==========================================================================================
;--------------------------------------------------------------------------
;super
[State -1, 2000]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 2000
triggerall = command = "super_01A" && statetype != A && power>= 3000
trigger1 = ctrl
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;super AIAIAI
[State -1, 2000]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 2000
triggerall = var(25) = 1 && statetype != A && power>= 3000 && movetype != H
trigger1 = random <= 50 && ctrl && P2bodydist X = [70,90]
trigger1 = P2stateno != [5100,5300]
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )

;--------------------------------------------------------------------------
;
;==========================================================================================
;--------------------------------------------------------------------------
;SPECIAL_01_A
[State -1, 1000]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1000
triggerall = command = "special_01A" && statetype != A
trigger1 = ctrl
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;SPECIAL_01_B
[State -1, 1010]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1010
triggerall = command = "special_01B" && statetype != A
trigger1 = ctrl
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325 )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;SPECIAL_01_B AIAIAI
[State -1, 1010]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1010
triggerall = var(25) = 1 && statetype != A && movetype != H && P2statetype != A
trigger1 = ctrl && P2bodydist X <= 20 && random <= 150 
trigger2 = random <= 150 && movecontact && ( stateno = 320 || stateno = 325 ) 

;SPECIAL_01_C
[State -1, 1020]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1020
triggerall = command = "special_01C" && statetype != A
trigger1 = ctrl
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325 )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;--------------------------------------------------------------------------
;SPECIAL_02_A
[State -1, 1100]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1100
triggerall = command = "special_02A" &&  statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,225] 
trigger3 = stateno = [240,245] 
trigger4 = stateno = [300,325] 

;SPECIAL_02_A AIAIAI
[State -1, 1100]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1100
triggerall = var(25) = 1 && statetype != A && movetype != H
trigger1 = random <= 200 && movecontact && ( stateno = 325 || stateno = 210 )
trigger2 = random <= 50 && P2bodydist X =[120,130]
trigger2 = P2stateno != [5100,5300]

;SPECIAL_02_B
[State -1, 1110]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1110
triggerall = command = "special_02B" &&  statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,225] 
trigger3 = stateno = [240,245] 
trigger4 = stateno = [300,325] 

;SPECIAL_02_C
[State -1, 1120]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1120
triggerall = command = "special_02C" &&  statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,225] 
trigger3 = stateno = [240,245] 
trigger4 = stateno = [300,325] 

;--------------------------------------------------------------------------
;SPECIAL_03_A
[State -1, 1200]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1200
triggerall = command = "special_03A" &&  statetype != A
trigger1 = ctrl
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = var(14) = 1 && movecontact && stateno = [200,230]
trigger7 = var(14) = 1 && movecontact && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;SPECIAL_03_A AIAIAI
[State -1, 1200]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1200
triggerall = var(25) = 1 &&  statetype != A && movetype != H
trigger1 = ctrl && random <= 50 && p2bodydist X = [180,220]

;SPECIAL_03_B
[State -1, 1201]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1201
triggerall = command = "special_03B" &&  statetype != A
trigger1 = ctrl
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = var(14) = 1 && movecontact && stateno = [200,230]
trigger7 = var(14) = 1 && movecontact && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;SPECIAL_03_C
[State -1, 1202]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1202
triggerall = command = "special_03C" &&  statetype != A
trigger1 = ctrl
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = var(14) = 1 && movecontact && stateno = [200,230]
trigger7 = var(14) = 1 && movecontact && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;SPECIAL_03_A AIAIAI
[State -1, 1200]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1202
triggerall = var(25) = 1 &&  statetype != A && movetype != H
trigger1 = ctrl && random <= 100 && p2bodydist X = [180,220]
trigger2 = random <= 50 && movecontact && (stateno = 325 || stateno = 205 || stateno = 210 )

;--------------------------------------------------------------------------
;SPECIAL_04_A
[State -1, 1300]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1300
triggerall = command = "special_04A" &&  statetype != A && var(14) = 0
trigger1 = ctrl || stateno = 40
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  ) 

;SPECIAL_04_B
[State -1, 1310]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1310
triggerall = command = "special_04B" &&  statetype != A && var(14) = 0
trigger1 = ctrl || stateno = 40
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )

;SPECIAL_04_C
[State -1, 1320]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1320
triggerall = command = "special_04C" &&  statetype != A && var(14) = 0
trigger1 = ctrl || stateno = 40
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )

;SPECIAL_04_C AIAIAI
[State -1, 1320]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1300
triggerall = var(25) = 1 &&  statetype != A && movetype != H
trigger1 = prevstateno = 2000 && P2statetype = A
trigger2 = random <= 50 && ctrl && P2bodydist X <= 25 && P2statetype = A && P2stateno != [5100,5300]

;--------------------------------------------------------------------------
;SPECIAL_04_A SPECIAL 
[State -1, 1800]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1800
triggerall = command = "special_04A" &&  statetype != A && var(14) = 1
trigger1 = ctrl || stateno = 40
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  ) 
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;SPECIAL_04_B SPECIAL
[State -1, 1810]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 2200
triggerall = command = "special_04B" &&  statetype != A && var(14) = 1
trigger1 = ctrl || stateno = 40
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;SPECIAL_04_C SPECIAL
[State -1, 1820]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 2220
triggerall = command = "special_04C" &&  statetype != A && var(14) = 1
trigger1 = ctrl || stateno = 40
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
;--------------------------------------------------------------------------
;SPECIAL_05_A
[State -1, 1400]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 1400
triggerall = command = "special_05A" &&  statetype = A
trigger1 = ctrl

;--------------------------------------------------------------------------
;SPECIAL_06_A wall jump
;chunli
[State -1, wall jump]
Type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
Trigger1 = FrontEdgeBodyDist <= 10 && command = "holdback" && stateno != 1600
trigger1 = statetype = A && Pos Y > -120
trigger1 = stateno = 50 && time = [20,26]
value = 1600

;chunli
[State -1, wall jump]
Type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
Trigger1 = backEdgeBodyDist <= 10 && command = "holdfwd" && stateno != 1610
trigger1 = statetype = A && Pos Y > -120
trigger1 = stateno = 50 && time = [20,26]
value = 1610


;--------------------------------------------------------------------------
;SPECIAL_07_A
;chunli
[State -1, 1700]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = command = "special_07A" &&  statetype != A && var(14) = 1
trigger1 = ctrl 
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
value = 1700

;chunli
[State -1, 1710]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = command = "special_07B" &&  statetype != A && var(14) = 1
trigger1 = ctrl 
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
value = 1710

;chunli
[State -1, 1720]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = command = "special_07C" &&  statetype != A && var(14) = 1
trigger1 = ctrl 
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
value = 1720

;--------------------------------------------------------------------------
;SPECIAL_09_A
;chunli
[State -1, 1900]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = command = "special_09A" &&  statetype != A && var(14) = 1
trigger1 = ctrl 
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
value = 1900

;chunli
[State -1, 1910]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = command = "special_09B" &&  statetype != A && var(14) = 1
trigger1 = ctrl 
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
value = 1910

;chunli
[State -1, 1920]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = command = "special_09C" &&  statetype != A && var(14) = 1
trigger1 = ctrl 
trigger2 = movecontact && ( stateno = 200 || stateno = 205 || stateno = 210 )
trigger3 = movecontact && ( stateno = 220 || stateno = 225 || stateno = 230 )
trigger4 = movecontact && ( stateno = 260 || stateno = 265 || stateno = 270 )
trigger5 = movecontact && ( stateno = 320 || stateno = 325  )
;
trigger6 = movecontact && var(14) = 1 && stateno = [200,230]
trigger7 = movecontact && var(14) = 1 && stateno = [300,330]
trigger8 = movecontact && var(14) = 1 && stateno = 410
;
value = 1920

;-----------------------------------------------------------------------------------------------------------------------------------
;EX and NORMAL change state
[State -1, 14444]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 14444
trigger1 = command = "b" &&  command = "y" && ctrl && statetype != A && var(14) = 0 && var(25) <= 0

[State -1, 44444]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 44444
trigger1 = command = "b" &&  command = "y" && ctrl && statetype != A && var(14) = 1 
;---------------------------------------------------------------------------
;=====================================================================
; Basic Throws
[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 500
triggerall = statetype = S && ctrl && stateno != 100
triggerall = P2statetype != L && P2movetype != H && P2statetype != A
trigger1 = command = "holdfwd" && command = "y" 
trigger1 = p2bodydist X < 15
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger2 = command = "holdfwd" && command = "z" 
trigger2 = p2bodydist X < 15
trigger2 = (p2statetype = S) || (p2statetype = C)

; Basic Throws
[State -1, throw]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 505
triggerall = statetype = S && ctrl && stateno != 100
triggerall = P2statetype != L && P2movetype != H && P2statetype != A
trigger1 = command = "holdback" && command = "y" 
trigger1 = p2bodydist X < 15
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger2 = command = "holdback" && command = "z" 
trigger2 = p2bodydist X < 15
trigger2 = (p2statetype = S) || (p2statetype = C)

;---------------------------------------------------------------------
;AIR THROWj
[State -1]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 900
triggerall = statetype = A && ctrl
trigger1 = command != "holdup" && command = "y" 
trigger1= command = "holdfwd" || command = "holddown"
trigger1 = p2bodydist X < 15
trigger1 = p2statetype = A
trigger1 = p2movetype != H

;AIR THROWj
[State -1]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 930
triggerall = statetype = A && ctrl
trigger1 = command != "holdup" && command = "z" 
trigger1= command = "holdfwd" || command = "holddown"
trigger1 = p2bodydist X < 15
trigger1 = p2statetype = A
trigger1 = p2movetype != H
;
;AIR THROWj
[State -1]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 940
triggerall = statetype = A && ctrl
trigger1 = command != "holdup" && command = "y" 
trigger1= command = "holdback" || command = "holddown"
trigger1 = p2bodydist X < 15
trigger1 = p2statetype = A
trigger1 = p2movetype != H

;AIR THROWj
[State -1]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 950
triggerall = statetype = A && ctrl
trigger1 = command != "holdup" && command = "z" 
trigger1= command = "holdback" || command = "holddown"
trigger1 = p2bodydist X < 15
trigger1 = p2statetype = A
trigger1 = p2movetype != H
;==========================================================================================
;--------------------------------------------------------------------------
;2710
[State -1, 2710]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 2710
triggerall = command = "b"  && statetype !=A && command = "holddown" && command = "holdfwd"
trigger1 = ctrl

;--------------------------------------------------------------------------
;2700
[State -1, 2700]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 2700
triggerall = command = "c" &&  statetype !=A && command = "holddown" && command = "holdfwd"
trigger1 = ctrl

;AIAIAI
[State -1, 2700]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 2700
triggerall = var(25) = 1 && statetype !=A && movetype != H
trigger1 = ctrl && P2stateno = 5120 && P2bodydist X <= 60 && random <= 50 

;==========================================================================================
;FMK
[State -1, 410]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 410
triggerall = command = "b" &&  statetype != A &&  command != "holddown" && var(14) = 1
trigger1 = ctrl
trigger2 = command = "holdfwd" && movecontact && stateno = [200,230]
trigger3 = command = "holdback" && movecontact && stateno = [200,230]
trigger4 = command = "holdfwd" && movecontact && stateno = [300,330]
trigger5 = command = "holdback" && movecontact && stateno = [300,330]
;==========================================================================================
;C LP
[State -1, 300]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 300
triggerall = command = "x" && command = "holddown" &&  statetype = C
trigger1 = ctrl
trigger2 = stateno = 300 && movecontact

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

;C LK
[State -1, 320]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 320
triggerall = command = "a" && command = "holddown" &&  statetype = C
trigger1 = ctrl
trigger2 = stateno = 320 && movecontact

;C MK
[State -1, 325]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 325
triggerall = command = "b" && command = "holddown" &&  statetype = C
trigger1 = ctrl

;NEAR C MK AIAIAI
[State -1, 225]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 325
triggerall = var(25) = 1 && p2bodydist X <= 60 && statetype != A && movetype != H && P2stateno != [5100,5300]
trigger1 = ctrl && P2statetype != A && random <= 50
trigger2 = movecontact && (stateno = 205 || stateno = 245 )

;C HK
[State -1, 330]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 330
triggerall = command = "c" && command = "holddown" &&  statetype = C
trigger1 = ctrl

;NEAR CHK AIAIAI
[State -1, 225]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 330
triggerall = var(25) = 1 && p2bodydist X <= 80 && statetype != A && movetype != H && P2stateno != [5100,5300]
trigger1 = ctrl && P2statetype != A  && random <= 40

;=====================================================================================================
;basic PK
;
;
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
[State -1, 225]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 205
triggerall = var(25) = 1 && p2bodydist X <= 25 && statetype != A && movetype != H && P2stateno != [5100,5300]
trigger1 = ctrl && P2statetype != A && random <= 50

;NEAR STAND HP
[State -1, 210]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 210
triggerall = command = "z" && command != "holddown" && p2bodydist X <= 25 && statetype = S
trigger1 = ctrl

;NEAR STAND HP AIAIAI
[State -1, 225]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 210
triggerall = var(25) = 1 && p2bodydist X <= 25 && statetype != A && movetype != H && P2stateno != [5100,5300]
trigger1 = ctrl && P2statetype != A && random <= 50

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

;FAR STAND HK
[State -1, 230]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 230
triggerall = var(25) = 1 && p2bodydist X <= 25 && statetype != A && movetype != H && P2stateno != [5100,5300]
trigger1 = ctrl  && P2statetype = A

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

;FAR STAND MP
[State -1, 245]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 245
triggerall = command = "y" && command != "holddown" && p2bodydist X > 25 && statetype = S
trigger1 = ctrl

;NEAR STAND MP AIAIAI
[State -1, 225]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 245
triggerall = var(25) = 1 && p2bodydist X <= 25 && statetype != A && movetype != H && P2stateno != [5100,5300]
trigger1 = ctrl && P2statetype != A && random <= 50

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

;FAR STAND HK
[State -1, 270]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
value = 270
triggerall = var(25) = 1 && p2bodydist X > 25 && statetype != A && movetype != H && P2stateno != [5100,5300]
trigger1 = ctrl && P2bodydist X <= 35 && P2statetype = A && prevstateno != 2000

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
;Auto Guard ¤@¯ë­n©ñ¦b state -1 ªº³Ì¤W¦ì¸m
[State -1];³o¬O¥Î¨Ó±±¨î¤Hª«ÃÛ¤U¾×ªº
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = P2stateno != 1301
triggerall = statetype != A && var(25) = 1 && movetype != H && ctrl = 1 && P2MoveType = A
triggerall = P2BodyDist X <= 200 && P2statetype = S			;¶ZÂ÷©¼ªñ®É
;
trigger1 = PrevStateNo != 151					;¦Ó¤§«e¤S¤£¬O¾×
trigger2 = PrevStateNo != 152
trigger3 = PrevStateNo != 153
value = 120							;´NÃÛ¤U¹w³Æ¨¾¿m

[State -1];³o¬O¥Î¨Ó±±¨î¤Hª«ÃÛ¤U¾×ªº
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = P2stateno != 1301
triggerall = statetype != A && var(25) = 1 && movetype != H && ctrl = 1 && P2MoveType = A
triggerall = P2BodyDist X <= 200 && P2statetype = S			;¶ZÂ÷©¼ªñ®É
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
[state -1]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = ctrl = 1 && movetype != H
trigger1 = P2bodyDist X != [40,100]		;³q±`·|¦b­n¦b¥Ø¼Ð¦ì¸m¥[´î 10-20 §@¬°ªÅ¶¡
trigger1 = Anim != 5
trigger1 = StateNo = 0
trigger1 = Pos Y = 0				;½T«O¬O¦b¦a¤W
value = 20

[state -1]
type = ChangeState
triggerall = RoundState = 2 ; No commands before FIGHT
triggerall = ctrl = 1 && movetype != H
trigger1 = P2bodyDist X = [160,200]			;³q±`·|¦b­n¦b¥Ø¼Ð¦ì¸m¥[´î 10-20 §@¬°ªÅ¶¡
trigger1 = Anim != 5
trigger1 = StateNo = 0
trigger1 = Pos Y = 0				;½T«O¬O¦b¦a¤W
value = 20
