;SF2_SAGAT
;var(8)   = 1 face is 1P
;var(8) = 2 face is 2P
;var(14) = 1 is EX
;var(14) = 0 is SF
;
;exp 13500 is SF
;exp 13560 is EX
;
;1,1 LPK air sound
;1,2 MPK air sound
;1,3 HPK air sound
;2,1                              to                                2,6           is hitsound
;3,1 is guard sound
;4,1 is jump
;6,1 is super sound
;5,1 is through sound
;fight FX
;1 is  L             FX no
;2 is M or H FX no
;3 is guard no
;30 is super effect
;40 is super finish
;
;DAMAGE
;LPK is 30
;MPK is 45
;HPK is 60
;
;POWER ADD
;LPK is 30 and MPK is 45 and HPK is 60 same asd energy
;
;GivePower 
;LPK is 10 and MPK is 15 and HPK is 20 is 1/3 of energy
;juggle
;LPK juggle = 5 MPK juggle = 10
;
;
pausetime
;LPK pausetime is 11,11 MPK is 13,13  HPK is 15,15
;
;====================================================================================================================
[Data]
power = 3000
life = 1000
attack = 100
defence = 100
fall.defence_up = 30
liedown.time = 20
airjuggle = 15
juggle = 15
sparkno = F2
guard.sparkno  = F3
KO.echo = 1
volume = 10
IntPersistIndex = 60
FloatPersistIndex = 40

[Size]
xscale = .2           
yscale = .2           
ground.back = 20
ground.front = 20
air.back = 20
air.front = 20
z.width = 3          
height = 60	     
attack.dist = 160
proj.attack.dist = 90
proj.doscale = 1
head.pos = -5, -90
mid.pos = -5, -60
shadowoffset = 0
draw.offset = 0,0

[Velocity]
walk.fwd  = 3
walk.back = -2.5
run.fwd  =  0
run.back = 0
jump.neu = 0,-10
jump.back = -2.8
jump.fwd = 3
runjump.back = -3.5,-9.5
runjump.fwd = 4,-9.5
airjump.neu = 0,-8.1
airjump.back = -2.55
airjump.fwd = 2.5

[Movement]
airjump.num = 0
airjump.height = 35
yaccel = .65				;.44 is default	1 is light and bigger is faster
stand.friction =.82				; .85  
crouch.friction =.82				; .82 



[Quotes]
victory1 = "I will win, no matter how many new scars i gain along the way!"
victory2 = "Your training has failed you. Hang up your gloves and quit!"
victory3 = "Kick me as hard as you can... You'll only brack your leg!"
victory4 = "I wont be satisfied until I  bear the title of world's strongest again!"
victory5 = "I am the only true champion. Its time to you learned your place."
victory6 = "You are not a warrior, you're a beginner!"
victory7 = "I will win, no matter how many new scars i gain along the way!"
;====================================================================================================
;time over lose
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170,1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 170,12]
type = AssertSpecial
trigger1 = Time = [0,140]
flag = RoundNotOver

;---------------------------------------------------------------------
;win
[Statedef 180]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0

[State 180,NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 180,ChangeState]
type = ChangeState
trigger1 = time = 0
value = 181

;------------------------ •ªŠò
[Statedef 181]
type = S
ctrl = 0
anim = 180
velset = 0,0

[State 1130,PlaySnd]
type = PlaySnd
trigger1 = anim = 180
trigger1 = Time = 1
value = 200,4


[State 1130,PlaySnd]
type = PlaySnd
trigger1 = anim = 181
trigger1 = Time = 1
value = 200,5

[State 1130,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = f180,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------
;intro
[Statedef 191]
type = S
ctrl = 0
anim = 0
velset = 0,0

[State 191, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 0

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, 3] ;Change to stand state when done
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;=====================================================================
;Near Stand Light Punch
[Statedef 200]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 200
juggle = 5

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 4, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up 			;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 30
;
pausetime = 8,8
guard.pausetime = 8,8
;
ground.slidetime = 10
;
ground.hittime = 10
air.hittime = 12
;
guard.hittime = 12
guard.ctrltime = 12
;
ground.velocity = -7
air.velocity = -2,-6
;
guard.velocity = -7
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -10
guard.cornerpush.veloff = -10
;
sparkxy = 0,-75
;
juggle = 10
hitsound = 19001,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 60
GivePower = 30
;
;p2getp1state = 
p2facing = 1
;
fall = 0
air.fall = 0
fall.recover = 0

[State 200,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;FAR Stand Light Punch

[State 200, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,0
persistent = 0

[Statedef 240]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 240
juggle = 5

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 4, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
;
damage = 30
;
pausetime = 8,8
guard.pausetime = 8,8
;
ground.slidetime = 10
;
ground.hittime = 10
air.hittime = 12
;
guard.hittime = 12
guard.ctrltime = 12
;
ground.velocity = -7
air.velocity = -2,-6
;
guard.velocity = -7
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -10
guard.cornerpush.veloff = -10
;
sparkxy = 0,-75
;
juggle = 10
hitsound = 19001,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 60
GivePower = 30
;
;p2getp1state = 
p2facing = 1
;
fall = 0
air.fall = 0
fall.recover = 0

[State 240,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;NEAR STAND LIGHT KICK

[State 240, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,0
persistent = 0

[Statedef 220]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 220
juggle = 5

[State 205,2]
type = HitDef
trigger1 = animelem = 3 || animelem = 4
priority = 4, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  up			;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 30
;
pausetime = 8,8
guard.pausetime = 8,8
;
ground.slidetime = 10
;
ground.hittime = 10
air.hittime = 15
;
guard.hittime = 12
guard.ctrltime = 12
;
ground.velocity = -7
air.velocity = -3,-5
;
guard.velocity = -10
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -7
guard.cornerpush.veloff = -7
;
sparkxy = 20,-45
;
juggle = 10
hitsound = 19002,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 30
GivePower = 10
;
;p2getp1state = 
p2facing = 1

[State 220,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;FAR STAND LIGHT KICK

[State 220, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,0
persistent = 0

[Statedef 260]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 260
juggle = 5

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 4, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 30
;
pausetime = 8,8
guard.pausetime = 8,8
;
ground.slidetime = 10
;
ground.hittime = 10
air.hittime = 15
;
guard.hittime = 12
guard.ctrltime = 12
;
ground.velocity = -7
air.velocity = -2,-6
;
guard.velocity = -7
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -10
guard.cornerpush.veloff = -10
;
sparkxy = 20,-45
;
juggle = 10
hitsound = 19002,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 30
GivePower = 10
;
;p2getp1state = 
p2facing = 1

[State 260,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;NEAR STAND MIDDLE PUNCH

[State 260, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,0
persistent = 0

[Statedef 205]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 205
juggle = 10

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
;
animtype = Medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up			;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 45
;
pausetime = 10,10
guard.pausetime = 10,10
;
ground.slidetime = 15
;
ground.hittime = 15
air.hittime = 15
;
guard.hittime = 13
guard.ctrltime = 13
;
ground.velocity = -9
air.velocity = -2,-6
;
guard.velocity = -9
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -18
guard.cornerpush.veloff = -18
;
sparkxy = 0,-75
;
juggle = 10
hitsound = 19001,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
getpower = 90
GivePower = 45
;
;p2getp1state = 
p2facing = 1

[State 205,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;FAR STAND MIDDLE PUNCH

[State 205, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,1
persistent = 0

[Statedef 245]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 245
juggle = 10

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = Medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 45
;
pausetime = 10,10
guard.pausetime = 10,10
;
ground.slidetime = 15
;
ground.hittime = 15
air.hittime = 15
;
guard.hittime = 13
guard.ctrltime = 13
;
ground.velocity = -9
air.velocity = -2,-6
;
guard.velocity = -9
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -18
guard.cornerpush.veloff = -18
;
sparkxy = 20,-75
;
juggle = 10
hitsound = 19001,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
getpower = 90
GivePower = 45
;
;p2getp1state = 
p2facing = 1

[State 245,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;NEAR STAND MIDDLE KICK

[State 245, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,1
persistent = 0

[Statedef 225]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 225
juggle = 10

[State 205,2]
type = HitDef
trigger1 = animelem = 3 || animelem = 4
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = Medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 45
;
pausetime = 10,10
guard.pausetime = 10,10
;
ground.slidetime = 15
;
ground.hittime = 15
air.hittime = 15
;
guard.hittime = 13
guard.ctrltime = 13
;
ground.velocity = -12
air.velocity = -2,-6
;
guard.velocity = -12
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -14
guard.cornerpush.veloff = -14
;
sparkxy = -10,-75
;
juggle = 10
hitsound = 19002,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
getpower = 45
GivePower = 15
;
;p2getp1state = 
p2facing = 1

[State 225,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;FAR STAND MIDDLE KICK

[State 225, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,1
persistent = 0

[Statedef 265]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 265
juggle = 10

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = Medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up ; = medium		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 45
;
pausetime = 10,10
guard.pausetime = 10,10
;
ground.slidetime = 15
;
ground.hittime = 15
air.hittime = 15
;
guard.hittime = 13
guard.ctrltime = 13
;
ground.velocity = -12
air.velocity = -2,-6
;
guard.velocity = -12
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -18
guard.cornerpush.veloff = -18
;
sparkxy = 0,-75
;
juggle = 10
hitsound = 19002,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
getpower = 90
GivePower = 45
;
;p2getp1state = 
p2facing = 1

[State 265,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;NEAR STAND HEAVY PUNCH

[State 265, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,1
persistent = 0

[Statedef 210]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 210
juggle = 15

[State 210,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
hitflag = MA			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
;
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = up ; = medium		;2p ANIM
ground.type = high
;
damage = 60
getpower = 120
GivePower = 60
;
pausetime = 12,12
guard.pausetime = 12,12
;
ground.slidetime = 20
;
ground.hittime = 20
air.hittime = 30
;
guard.hittime = 17
guard.ctrltime =17
;
ground.velocity = -12
air.velocity = -2,-6
guard.velocity = -12
airguard.velocity = -4,-5
air.juggle = 16
;
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
;
sparkxy = -40,-70
;
juggle = 10
hitsound = 19001,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3

[State 210,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;FAR STAND HEAVY PUNCH

[State 210, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,2
persistent = 0

[Statedef 250]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 250
juggle = 15

[State 210,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
hitflag = MA			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
;
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = up ; = medium			;2p ANIM
ground.type = high
;
damage = 60
getpower = 120
GivePower = 60
;
pausetime = 12,12
guard.pausetime = 12,12
;
ground.slidetime = 20
;
ground.hittime = 20
air.hittime = 30
;
guard.hittime = 17
guard.ctrltime =17
;
ground.velocity = -12
air.velocity = -2,-6
guard.velocity = -12
airguard.velocity = -4,-5
air.juggle = 16
;
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
;
sparkxy = -40,-70
;
juggle = 10
hitsound = 19001,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3

[State 250,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;NEAR STAND HEAVY KICK

[State 250, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,2
persistent = 0

[Statedef 230]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 230
juggle = 15

[State 210,2]
type = HitDef
trigger1 = animelem = 3
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
hitflag = MA			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
;
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = up ; = medium			;2p ANIM
ground.type = high
;
damage = 60
getpower = 60
GivePower = 20
;
pausetime = 14,14
guard.pausetime = 14,14
;
ground.slidetime = 20
;
ground.hittime = 20
air.hittime = 30
;
guard.hittime = 17
guard.ctrltime =17
;
ground.velocity = -5
air.velocity = -3,-5
guard.velocity = -15
airguard.velocity = -4,-5
air.juggle = 16
;
ground.cornerpush.veloff = -25
guard.cornerpush.veloff = -25
;
sparkxy = -20,-65
;
juggle = 10
hitsound = 19002,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3

[State 210,2]
type = HitDef
trigger1 = animelem = 4
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
hitflag = MA			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
;
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = up ; = medium			;2p ANIM
ground.type = high
;
damage = 60
getpower = 60
GivePower = 20
;
pausetime = 12,12
guard.pausetime = 12,12
;
ground.slidetime = 20
;
ground.hittime = 20
air.hittime = 30
;
guard.hittime = 17
guard.ctrltime =17
;
ground.velocity = -12
air.velocity = -3,-5
guard.velocity = -12
airguard.velocity = -4,-5
air.juggle = 16
;
ground.cornerpush.veloff = -25
guard.cornerpush.veloff = -25
;
sparkxy = -20,-65
;
juggle = 10
hitsound = 19002,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3

[State 230,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;FAR STAND HEAVY KICK

[State 230, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,2
persistent = 0

[Statedef 270]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 270
juggle = 15

[State 210,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
hitflag = MA			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
;
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = up ; = up			;2p ANIM
ground.type = high
;
damage = 60
getpower = 120
GivePower = 60
;
pausetime = 12,12
guard.pausetime = 12,12
;
ground.slidetime = 20
;
ground.hittime = 20
air.hittime = 30
;
guard.hittime = 17
guard.ctrltime =17
;
ground.velocity = -12
air.velocity = -3,-5
guard.velocity = -12
airguard.velocity = -4,-5
air.juggle = 16
;
ground.cornerpush.veloff = -25
guard.cornerpush.veloff = -25
;
sparkxy = -20,-65
;
juggle = 10
hitsound = 19002,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3

[State 270,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================================================================================================
;---------------------------------------------------------------------------
;C LP

[State 270, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,2
persistent = 0

[Statedef 300]
type = C
movetype = A
physics = C
ctrl = 0
velset = 0
anim = 300
juggle = 5

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 4, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = C,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up ; = light			;2p ANIM
ground.type = low			;  high,	middle	low	trip
;
damage = 30
;
pausetime = 10,10
guard.pausetime = 10,10
;
ground.slidetime = 10
;
ground.hittime = 10
air.hittime = 15
;
guard.hittime = 12
guard.ctrltime = 12
;
ground.velocity = -8
air.velocity = -3,-5
;
guard.velocity = -8
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -10
guard.cornerpush.veloff = -10
;
sparkxy = -10,-35
;
juggle = 10
hitsound = 19001,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 30
GivePower = 10
;
;p2getp1state = 
p2facing = 1

[State 300,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;CMP

[State 300, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,0
persistent = 0

[Statedef 305]
type = C
movetype = A
physics = C
ctrl = 0
velset = 0
anim = 305
juggle = 10

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = C,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = Medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up ; = medium		;2p ANIM
ground.type = low			;  high,	middle	low	trip
;
damage = 45
;
pausetime = 12,12
guard.pausetime = 12,12
;
ground.slidetime = 15
;
ground.hittime = 15
air.hittime = 15
;
guard.hittime = 13
guard.ctrltime = 13
;
ground.velocity = -10
air.velocity = -3,-5
;
guard.velocity = -10
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -18
guard.cornerpush.veloff = -18
;
sparkxy = -10,-45
;
juggle = 10
hitsound = 19001,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
getpower = 45
GivePower = 15
;
;p2getp1state = 
p2facing = 1

[State 305,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;C H P

[State 305, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,1
persistent = 0

[Statedef 310]
type = C
physics = C
movetype = A
ctrl = 0
velset = 0
anim = 310
juggle = 15

[State 210,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr =C,NA			;STAND / NORMAL ATTACK
hitflag = MA			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
;
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = up ; = medium			;2p ANIM
ground.type = low
;
damage = 60
getpower = 60
GivePower = 20
;
pausetime = 14,14
guard.pausetime = 14,14
;
ground.slidetime = 20
;
ground.hittime = 20
air.hittime = 30
;
guard.hittime = 17
guard.ctrltime =17
;
ground.velocity = -12
air.velocity = -3,-5
guard.velocity = -12
airguard.velocity = -4,-5
air.juggle = 16
;
ground.cornerpush.veloff = -25
guard.cornerpush.veloff = -25
;
sparkxy = -10,-55
;
juggle = 10
hitsound = 19001,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3

[State 310,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;C LK

[State 310, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,2
persistent = 0

[Statedef 320]
type = C
movetype = A
physics = C
ctrl = 0
velset = 0
anim = 320
juggle = 5

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 4, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = C,NA			;STAND / NORMAL ATTACK
guardflag = L			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up ; = medium		;2p ANIM
ground.type = low			;  high,	middle	low	trip
;
damage = 30
;
pausetime = 10,10
guard.pausetime = 10,10
;
ground.slidetime = 10
;
ground.hittime = 10
air.hittime = 15
;
guard.hittime = 12
guard.ctrltime = 12
;
ground.velocity = -8
air.velocity = -3,-5
;
guard.velocity = -8
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -10
guard.cornerpush.veloff = -10
;
sparkxy = -30,-10
;
juggle = 10
hitsound = 19002,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 30
GivePower = 10
;
;p2getp1state = 
p2facing = 1

[State 320,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;C M K

[State 320, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,0
persistent = 0

[Statedef 325]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 325
juggle = 10

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = C,NA			;STAND / NORMAL ATTACK
guardflag = L			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = Medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up ; = medium		;2p ANIM
ground.type = low			;  high,	middle	low	trip
;
damage = 45
;
pausetime = 10,10
guard.pausetime = 10,10
;
ground.slidetime = 15
;
ground.hittime = 15
air.hittime = 15
;
guard.hittime = 13
guard.ctrltime = 13
;
ground.velocity = -10
air.velocity = -3,-5
;
guard.velocity = -10
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -18
guard.cornerpush.veloff = -18
;
sparkxy = -20,-15
;
juggle = 10
hitsound = 19002,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
getpower = 45
GivePower = 15
;
;p2getp1state = 
p2facing = 1

[State 325,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;C H K

[State 325, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,1
persistent = 0

[Statedef 330]
type = C
physics = C
movetype = A
ctrl = 0
velset = 0
anim = 330
juggle = 15

[State 330,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit
;
attr = C,NA			;STAND / NORMAL ATTACK
hitflag = MA			;MIDDLE ATTACK
guardflag = L			;GUARD is MIDDLE /L is LOW
;
animtype = hard			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up ; = medium		;2p ANIM
ground.type = low			;  high,	middle	low	trip
;
damage = 60
getpower = 60
GivePower = 20
;
pausetime = 12,12
guard.pausetime = 12,12
;
ground.slidetime = 15
ground.hittime = 15
air.hittime = 9
;
guard.hittime = 15
guard.ctrltime = 15
;
ground.velocity = -2,-6
air.velocity = -2,-6
guard.velocity = -12
airguard.velocity = -4,-2
air.juggle = 16
;
ground.cornerpush.veloff = -25
guard.cornerpush.veloff = -25
;
sparkxy =-10,-15
;
juggle = 10
hitsound = 19002,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
;
fall = 1
fall.recover = 0
air.juggle = 16

[State 330,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;=================================================================================================================== 
; FRONT/BACk 		JUMP light punch

[State 330, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,2
persistent = 0

[Statedef 340]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 340 

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 4, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 30
pausetime = 8,9
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 13
air.hittime = 9
guard.ctrltime = 13
ground.velocity = -4
air.velocity = -2,-6
guard.velocity = -4
airguard.velocity = -3, -1.5
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
juggle = 5
hitsound = 19001,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 30
GivePower = 10
;
air.juggle = 16

;==============================================================
; STRIGHT JUMP light punch

[State 340, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,0
persistent = 0

[Statedef 370]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 370 

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 4, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
;
damage = 30
pausetime = 8,10
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 14
air.hittime = 9
guard.ctrltime = 14
ground.velocity = -4
air.velocity = -2,-6
guard.velocity = -4
airguard.velocity = -3, -1.5
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
juggle = 5
hitsound = 19001,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 30
GivePower = 10
;
air.juggle = 16

;==============================================================
; FRONT/BACk 		JUMP light K

[State 370, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,0
persistent = 0

[Statedef 355]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 355

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 4, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 30
pausetime = 8,9
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 14
air.hittime = 9
ground.velocity = -4
air.velocity = -2,-6
guard.velocity = -4
airguard.velocity = -3, -1.5
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-25
;
juggle = 5
hitsound = 19001,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 30
GivePower = 10
;
air.juggle = 16

;==============================================================
; stright 		JUMP light K

[State 355, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,0
persistent = 0

[Statedef 385]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 385

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 4, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = light			;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 30
pausetime = 8,10
ground.slidetime = 9
ground.hittime = 9
guard.hittime = 14
air.hittime = 9
guard.ctrltime = 14
ground.velocity = -4
air.velocity = -2,-6
guard.velocity = -4
airguard.velocity = -3, -1.5
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
juggle = 5
hitsound = 19002,0
guardsound = 19003,0
sparkno = 1
guard.sparkno = 3
getpower = 30
GivePower = 10
;
air.juggle = 16

;==============================================================
; F/B 		JUMP MP

[State 385, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,0
persistent = 0

[Statedef 345]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 345
juggle = 7

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit
;
attr = A, NA
hitflag = MAF
guardflag = HA
;
animtype = medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
;
pausetime = 10,10
ground.slidetime = 8
ground.hittime = 8
;
damage = 45
guard.hittime = 14
air.hittime = 9
ground.velocity = -6
air.velocity = -3,-6
guard.velocity = -6
airguard.velocity = -4, -1
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
hitsound = 19001,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
;
getpower = 30
GivePower = 10
;
air.fall = 1
fall = 0
fall.recover = 0

;==============================================================
;STRIGHT 		JUMP MP

[State 345, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,1
persistent = 0

[Statedef 375]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 375

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
;
pausetime = 10,11
ground.slidetime = 8
ground.hittime = 8
;
damage = 45
guard.hittime = 14
air.hittime = 9
ground.velocity = -7
air.velocity = -3,-4
guard.velocity = -7
airguard.velocity = -3, -1
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
hitsound = 19001,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
;
getpower = 30
GivePower = 10
;
air.juggle = 16
juggle = 10

;==============================================================
;F/B		JUMP MK

[State 375, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,1
persistent = 0

[Statedef 360]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 360
juggle = 10

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
ground.type = Low
;
animtype = medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
pausetime = 10,11
ground.slidetime = 8
ground.hittime = 8
;
damage = 45
guard.hittime = 14
air.hittime = 9
guard.ctrltime = 14
ground.velocity = -7
air.velocity = -3,-4
guard.velocity = -7
airguard.velocity = -3, -1
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
hitsound = 19002,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
;
getpower = 30
GivePower = 10
;
air.juggle = 16
juggle = 10

;==============================================================
;STRIGHT 		JUMP MK

[State 360, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,1
persistent = 0

[Statedef 390]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 390
juggle = 10

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
pausetime = 10,11
ground.slidetime = 8
ground.hittime = 8
;
damage = 45
guard.hittime = 14
air.hittime = 9
ground.velocity = -7
air.velocity = -3,-4
guard.velocity = -7
airguard.velocity = -3, -1
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
hitsound = 19002,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
;
getpower = 30
GivePower = 10
;
air.juggle = 16
juggle = 10

;==============================================================
;F/B		JUMP HP

[State 390, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,1
persistent = 0

[Statedef 350]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 350
juggle = 15

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 60
pausetime = 10,11
;
ground.slidetime = 10
ground.hittime = 10
;
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = -8
air.velocity = -3,-4
guard.velocity = -11
airguard.velocity = -3, -1
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
hitsound = 19001,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
;
getpower = 60
GivePower = 20
;
air.juggle = 16
juggle = 10

;==============================================================
;STRIGHT		JUMP HP

[State 350, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,2
persistent = 0

[Statedef 380]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 380
juggle = 15

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 60
pausetime = 10,11
;
ground.slidetime = 10
ground.hittime = 10
;
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = -7
air.velocity = -3,-4
guard.velocity = -9
airguard.velocity = -3, -1
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
hitsound = 19001,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
;
getpower = 60
GivePower = 20
;
air.juggle = 16
juggle = 10

;==============================================================
;F/B		JUMP HK

[State 380, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 2
value = F19004,2
persistent = 0

[Statedef 365]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 365
juggle = 15

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 60
pausetime = 10,11
;
ground.slidetime = 10
ground.hittime = 10
;
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = -7
air.velocity = -3,-4
guard.velocity = -9
airguard.velocity = -3, -1
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
hitsound = 19002,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
;
getpower = 60
GivePower = 20
;
air.juggle = 16
juggle = 10

;==============================================================
;ST		JUMP HK

[State 365, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,2
persistent = 0

[Statedef 395]
type = A
movetype = A
physics = A
ctrl = 0  
anim = 395
juggle = 15

[State 300,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit
;
attr = A, NA
hitflag = MA
guardflag = HA
;
animtype = medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype =  hard		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 60
pausetime = 10,11
;
ground.slidetime = 10
ground.hittime = 10
;
guard.hittime = 17
air.hittime = 9
guard.hittime = 17
ground.velocity = -7
air.velocity = -3,-4
guard.velocity = -9
airguard.velocity = -3, -1
ground.cornerpush.veloff = -8
guard.cornerpush.veloff = -8
sparkxy = 0,-55
;
hitsound = 19002,2
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
;
getpower = 60
GivePower = 20
;
air.juggle = 16
juggle = 10

;---------------------------------------------------------------------------
;FAR STAND MIDDLE KICK

[State 395, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 3
value = F19004,2
persistent = 0

[Statedef 405]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0
anim = 405
juggle = 10

[State 1310,snd]
type = PlaySnd
trigger1 = animelem = 2
value = 500,2

[State 1310,snd]
type = Velset
trigger1 = time >= 0
x = 8
[State 1310,snd]
type = Velset
trigger1 = time >= 3
x = 6
[State 1310,snd]
type = Velset
trigger1 = time >= 6
x = 3
[State 1310,snd]
type = Velset
trigger1 = time >= 9
x = 1
[State 1310,snd]
type = Velset
trigger1 = time >= 12
x = 0.5

[State 205,2]
type = HitDef
trigger1 = time = 0
priority = 3, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
;
attr = S,NA			;STAND / NORMAL ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
hitflag = MA
;
animtype = Medium		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup".
air.animtype = up ; = medium		;2p ANIM
ground.type = high			;  high,	middle	low	trip
;
damage = 45
;
pausetime = 10,10
guard.pausetime = 10,10
;
ground.slidetime = 15
;
ground.hittime = 15
air.hittime = 15
;
guard.hittime = 13
guard.ctrltime = 13
;
ground.velocity = -12
air.velocity = -2,-6
;
guard.velocity = -12
airguard.velocity = -3, -2
;
air.juggle = 16
;
ground.cornerpush.veloff = -18
guard.cornerpush.veloff = -18
;
sparkxy = 0,-75
;
juggle = 10
hitsound = 19002,1
guardsound = 19003,0
sparkno = 2
guard.sparkno = 3
getpower = 90
GivePower = 45
;
;p2getp1state = 
p2facing = 1

[State 265,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=====================================================================
; Definition of the Basic Throws
;=====================================================================
;===========================================

[State 405, HD shared normal swing]
type = PlaySnd
trigger1 = AnimElem = 5
value = F19004,1
persistent = 0

[Statedef 500]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 500

[State 1200,HitDef]
type = Hitdef
trigger1 = Time = 0 && P2bodydist X <= 25 && P2statetype != A && P2statetype != L && P2movetype != H && statetype != A && P2stateno != 50 && P2stateno != 51 
;trigger1 = command = "throw_01B"
attr = S, NT		
getpower = 60
givepower = 20
hitflag = MA			;M-
guardflag = -1			;None
priority = 3,miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 501
p2stateno = 505
fall = 1
fall.recover = 0

[State 1200,End]
type = ChangeState
trigger1 = time = 1
value = 205

;===========================================
[Statedef 510]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 500

[State 1200,HitDef]
type = Hitdef
trigger1 = Time = 0 && P2bodydist X <= 25 && P2statetype != A && P2statetype != L && P2movetype != H && statetype != A && P2stateno != 50 && P2stateno != 51 
;trigger1 = command = "throw_01B"
attr = S, NT		
getpower = 60
givepower = 20
hitflag = MA			;M-
guardflag = -1			;None
priority = 3,miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 501
p2stateno = 505
fall = 1
fall.recover = 0

[State 1200,End]
type = ChangeState
trigger1 = time = 1
value = 210

;------------------------------------------------------------------------------------
[Statedef 501]
type = S
movetype = A
physics = S
anim = 501
velset = 0, 0
ctrl = 0

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos  = 50,0
time = 5

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos  = 20,-120
time = 16

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos  = -30,-100
time = 6

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos  = -100,0
time = 4

[State 1310,snd]
type = PlaySnd
trigger1 = animelem = 2
value = 200,1

[State 1310,TargetBind]
type = turn
trigger1 = animtime = 0
persistent = 0 

[State 1200,End]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------------------
[Statedef 505]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 910, 0]
type = ChangeAnim2
Trigger1 = Time = 0 
value = 505

[State 1215,SprPriority]
type = SprPriority
trigger1 = time >= 0
value = -1

[State 911, 1]
type = velset
Trigger1 = time >= 37
x = 4
y = -7
[State 911, 1]
type = velset
Trigger1 = time >= 42
y = -3
[State 911, 1]
type = velset
Trigger1 = time >= 47
y = 0
[State 911, 1]
type = velset
Trigger1 = time >= 52
y = 3
[State 911, 1]
type = velset
Trigger1 = time >= 57
y = 7

[State 911, 1]
type = LifeAdd
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -100

[State 1335,SelfState]
type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100


;===========================================
[Statedef 520]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 500

[State 1200,HitDef]
type = Hitdef
trigger1 = Time = 0 && P2bodydist X <= 25 && P2statetype != A && P2statetype != L && P2movetype != H && statetype != A && P2stateno != 50 && P2stateno != 51 
;trigger1 = command = "throw_01B"
attr = S, NT		
getpower = 60
givepower = 20
hitflag = MA			;M-
guardflag = -1			;None
priority = 3,miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 521
p2stateno = 525
fall = 1
fall.recover = 0

[State 1200,End]
type = ChangeState
trigger1 = time = 1
value = 205

;===========================================
[Statedef 530]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 500

[State 1200,HitDef]
type = Hitdef
trigger1 = Time = 0 && P2bodydist X <= 25 && P2statetype != A && P2statetype != L && P2movetype != H && statetype != A && P2stateno != 50 && P2stateno != 51 
;trigger1 = command = "throw_01B"
attr = S, NT		
getpower = 60
givepower = 20
hitflag = MA			;M-
guardflag = -1			;None
priority = 3,miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 521
p2stateno = 525
fall = 1
fall.recover = 0

[State 1200,End]
type = ChangeState
trigger1 = time = 1
value = 210


;------------------------------------------------------------------------------------
[Statedef 521]
type = S
movetype = A
physics = S
anim = 501
velset = 0, 0
ctrl = 0

[State 1310,TargetBind]
type = turn
trigger1 = time = 0
persistent = 0 

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos  = 50,0
time = 5

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos  = 20,-120
time = 16

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos  = -30,-100
time = 6

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos  = -100,0
time = 4

[State 1310,snd]
type = PlaySnd
trigger1 = animelem = 2
value = 200,1

[State 1310,TargetBind]
type = turn
trigger1 = animtime = 0
persistent = 0 

[State 1200,End]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------------------
[Statedef 525]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 1310,TargetBind]
type = turn
trigger1 = time = 0
persistent = 0 

[State 910, 0]
type = ChangeAnim2
Trigger1 = Time = 0 
value = 505

[State 1215,SprPriority]
type = SprPriority
trigger1 = time >= 0
value = -1

[State 911, 1]
type = velset
Trigger1 = time >= 37
x = 4
y = -7
[State 911, 1]
type = velset
Trigger1 = time >= 42
y = -3
[State 911, 1]
type = velset
Trigger1 = time >= 47
y = 0
[State 911, 1]
type = velset
Trigger1 = time >= 52
y = 3
[State 911, 1]
type = velset
Trigger1 = time >= 57
y = 7

[State 911, 1]
type = LifeAdd
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -100

[State 1335,SelfState]
type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100























;=================================================================
[Statedef 14444]
type    = S
movetype= A
physics = N
ctrl = 0

;varset
[State 14444, var]
type = Varadd
trigger1 =  var(14) = 0
v = 14
ignorehitpause = 1
value = 1

[State 14444, var]
type = ChangeState
trigger1 = time = 5
value = 0
ctrl = 1

[Statedef 44444]
type    = S
movetype= A
physics = N
ctrl = 0

[State 14444, var]
type = Varadd
trigger1 =  var(14) = 1
v = 14
ignorehitpause = 1
value = -1

[State 14444, var]
type = ChangeState
trigger1 = time = 5
value = 0
ctrl = 1

;===========================================================================
;Pause Menu
[Statedef 2992]
movetype= I
velset = 0,0
ctrl = 0
anim = 8011
poweradd = 0

[State 3991, NotHitBy]
type = NotHitBy
trigger1 = 1
ignorehitpause = 1
value = SCA
time = 1

[State 2992, SuperPause Taunt]
type = SuperPause
trigger1 = time = 2
trigger1 = !NumExplod(2992)
pos = 0, 0
darken = 1
p2defmul = 0
anim = -1
time = 99999
movetime= 99999
sound = s106,0
poweradd = 0
unhittable = 1
pausebg = 1
ignorehitpause = 1
ontop = 1

;720-------------------------------------------------------
[State 2992]
type = Explod
trigger1 = !NumExplod(2992)
trigger1 = time = 1
anim = 8990
id = 8990
pos = 160,20
postype = left
ownpal = 1
bindtime = -1
removetime = -1
ignorehitpause = 1
ontop = 1
sprpriority = 20
scale = .2,.2

[State 2992]
type = Explod
trigger1 = !NumExplod(2992)
trigger1 = time = 1
anim = 8991
id = 8990
pos = 160,20
postype = left
ownpal = 1
bindtime = -1
removetime = -1
ignorehitpause = 1
ontop = 1
scale = .2,.2

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = numhelper(5306)!=0
flag = nomusic
;-------------------------------------------------------

[State 3991, AssertSpecial]
type = AssertSpecial
trigger1 = !NumExplod(2992)
trigger1 = time = 3
;trigger1 = Root, command = "start"
flag = nobardisplay
flag2 = timerfreeze;nomusic
ignorehitpause =  1

[State 120]
type = RemoveExplod
trigger1 = time != 0
trigger1 = Root, command = "start"
id = 8990

[State 4900, pause]
type = superPause
trigger1 = time != 0
trigger1 = Root, command = "start"
anim = -1
time = 1
movetime = 1

[State 2993, 3]
type = DestroySelf
trigger1 = time != 0
trigger1 = Root, command = "start"
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;DIZZY
[Statedef 5300]
type    = A
movetype= H
physics = N

[State 5300, 1]
type = Varset
trigger1 = time = 0
var(32) = 0

[State 5300, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 5301

[State 5300, 4]
type = Nothitby
trigger1 = 1
value = SCA

;-----------------------------------------------------------------------------------
[Statedef 5301]
type    = A
movetype= H
physics = N
anim = 5070

[State 5301]
Type = VarRandom
Trigger1 = PrevStateNo != 5042
V = 35
Range = 0, 3

[State 5301, Dizzy]
type = Explod
trigger1 = Time = 0
Anim = f150 + Var(35)
pos = const(size.head.pos.x), const(size.head.pos.y)
postype = p1
sprpriority = 2
scale = .9,.9
ownpal = 1
bindtime = -1
removeongethit = 1
ID = 4070
removetime = -1

[State 5301, Dizzy]
type = Explod
trigger1 = Time = 0
Anim = f154 + Var(35)
pos = const(size.head.pos.x), const(size.head.pos.y)
postype = p1
sprpriority = 2
scale = .9,.9
ownpal = 1
bindtime = -1
removeongethit = 1
ID = 4070
removetime = -1

[State 5301, Dizzy]
type = Explod
trigger1 = Time = 0
Anim = f158 + Var(35)
pos = const(size.head.pos.x), const(size.head.pos.y)
postype = p1
sprpriority = 2
scale = .9,.9
ownpal = 1
bindtime = -1
removeongethit = 1
ID = 4070
removetime = -1

[State 5301, Dizzy Sound]
type = PlaySnd
trigger1 = Time = 0
value = f300, IFelse(Var(35) = 0, 1, IFelse(Var(35) = 1, 0, IFelse(Var(35) = 2, 2, 3)))
channel = 2
loop = 1

[State 501,velset]
type = velset
trigger1 = time = 0
x = -7.5
y = -14

[State 5030, 1]
type = VelAdd
trigger1 = time >= 0; [48,60]
y = 2

[State 5301, 3]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= -40
value = 5302

[State 5301, 4]
type = Nothitby
trigger1 = 1
value = SCA

[State 5301, 5]
type = pause
trigger1 = timemod = 2,0
trigger1 = time <= 10
time = 1

;------------------------------------
[Statedef 5302]
type    = L
movetype= H
physics = N

[State 5302, 1.1]
type = Velset
trigger1 = time = 0
y = -5.5

[State 5302, 1.2]
type = Velmul
trigger1 = timemod = 2,3
trigger1 = time > 3
x = .98

[State 5302, 2.1]
type = Changeanim
trigger1 = time < 3
value = 5160

[State 5302, 3.1]
type = posset
trigger1 = time = 0
y = 20

[State 5302, 5]
type = null;GameMakeAnim
trigger1 = Time = 0
value = 60
pos = 0, -20
under = 1

[State 5302, 6]
type = posfreeze
trigger1 = time < 3

[State 5302, 7]
type = Gravity
trigger1 = time > 3

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
x = -3
y = -6

[State 5302, 8]
type = ChangeState
trigger1 = time > 3
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5303

;------------------------------------------------------------------------------
[Statedef 5303]
type    = L
movetype= H
physics = N
velset = 0,0
anim = 5110

[State 5303, 1]
type = posset
trigger1 = time = 0
y = 0

[State 5303, 1]
type = velset
trigger1 = time = 0
x = -2

[State 5303, 1]
type = velset
trigger1 = time = 11
x = 0

[State 5303, 3]
type = null;GameMakeAnim
trigger1 = Time = 0
value = 60
pos = 0, 0
under = 1

[State 5303, 4]
type = ChangeState
triggerall = !alive
trigger1 = Time = 0
value = 5150

[State 5303, 5]
type = ChangeState
triggerall = alive
trigger1 = Time = 25
value = 5304

[State 5303, 6]
type = Nothitby
trigger1 = 1
value = SCA

;-----------------------------------------------------------------------------------
[Statedef 5304]
type    = L
movetype= I
physics = N
anim = 5120
velset = 0,0

[State 5304, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5304, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 5305
ctrl = 0

;------------------------------------------------------------------------------------
[Statedef 5305]
type    = S
physics = S
anim = 5300
ctrl = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = Command = "x"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 240
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "y" && command != "holddown" && statetype != A && command != "holdfwd"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 245
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "z" && command != "holddown" && statetype != A && command = "holdfwd"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 250
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "a"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 260
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "b"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 265
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "c"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 270
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "y" && command != "holddown" && statetype != A && command = "holdfwd"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 245
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "z" && command != "holddown" && statetype != A && command = "holdfwd"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 410
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_01A"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1000
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_01B"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1010
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_01C"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1020
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_02A"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1100
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_02B"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1110
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_02C"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1120
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_03A"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1200
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_03B"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1210
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_03C"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1220
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_04A"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1300
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_04B"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1310
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "special_04C"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 1320
p2stateno = 0

[State 0, ReversalDef]
type = ReversalDef
triggerall = command = "super_01A"
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
reversal.attr = S,NA           ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
pausetime = 0,20
p1stateno = 2000
p2stateno = 0



[State 5305, 1]
type = ChangeState
trigger1 = Time = 138
trigger2 = Time >= 30 && Var(38) >= 5
value = 0
ctrl = 1

[State 5305, 2]
type = Varset
trigger1 = Time = 0
var(38) = 0

[State 5305, 3]
type = Varadd
Trigger1 = Command = "up" || Command = "down" || Command = "fwd" || Command = "back" || Command = "a" || Command = "b" || Command = "c" || Command = "x" || Command = "y" || Command = "z"
var(38) = 1
;===========================================================================

[Statedef 5306]
type    = S
physics = S
anim = 8011
ctrl = 0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nomusic
ignorehitpause=1
persistent = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = anim  =5500
channel = -1
ignorehitpause = 1
persistent = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SRyu"
value = f0,0
loop = 1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SHonda"
value = f0,1
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SBlanka"
value = f0,2
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SGuile"
value = f0,3
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SThawk"
value = f0,4
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SDeejay"
value = f0,5
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SBox"
value = f0,6
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SSagat"
value = f0,7
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SKen"
value = f0,8
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SChunli"
value = f0,9
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SZangief"
value = f0,10
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SDhalsim"
value = f0,11
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SCammy"
value = f0,12
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SFeilong"
value = f0,13
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SClaw"
value = f0,14
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SBoss"
value = f0,15
loop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =1
trigger1 = StageVar(info.name) = "SAkuma"
value = f0,16
loop = 1

[Statedef 5307]
type    = S
physics = S
anim = 8011
ctrl = 0

[State 0, Explod]
type = Explod
trigger1 = time =1
trigger1 = StageVar(info.name) = "SGuile"
anim = f200
ID = 8585
pos = -265,-11
sprpriority = -10
space = stage
facing = -1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8592) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SGuile"
anim = f204
ID = 8592
pos = -265,-11
sprpriority = -10
space = stage
facing = -1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8591) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SGuile"
anim = f205
ID = 8591
pos = -265,-11
sprpriority = -10
space = stage
facing = -1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8590) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SGuile"
anim = f206
ID = 8590
pos = -265,-11
sprpriority = -10
space = stage
facing = -1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8589) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SGuile"
anim = f207
ID = 8589
pos = -265,-11
sprpriority = -10
space = stage
facing = -1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8588) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SGuile"
anim = f208
ID = 8588
pos = -265,-11
sprpriority = -10
space = stage
facing = -1
scale = .77,.75

[State 0, Explod]
type = Explod
trigger1 = time =1
triggerall = StageVar(info.name) = "SGuile"
anim = f200
ID = 8584
pos = 233,-11
sprpriority = -10
space = stage
facing = 1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8572) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SGuile"
anim = f204
ID = 8572
pos = 233,-11
sprpriority = -10
space = stage
facing = 1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8571) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SGuile"
anim = f205
ID = 8571
pos = 233,-11
sprpriority = -10
space = stage
facing = 1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8570) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SGuile"
anim = f206
ID = 8570
pos = 233,-11
sprpriority = -10
space = stage
facing = 1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8579) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SGuile"
anim = f207
ID = 8579
pos = 233,-11
sprpriority = -10
space = stage
facing = 1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8575) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SGuile"
anim = f208
ID = 8575
pos = 233,-11
sprpriority = -10
space = stage
facing = 1
scale = .77,.75


[State 0, Explod]
type = Explod
trigger1 = time =1
trigger1 = StageVar(info.name) = "SKen"
anim = f209
ID = 8584
pos = 210,-5
sprpriority = -5
space = stage
facing = 1
scale = .6,.7

[State 0, Explod]
type = Explod
triggerall = numExplod(8592) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >223
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >223
triggerall = StageVar(info.name) = "SKen"
anim = f210
ID = 8592
pos = 210,-5
sprpriority = -5
space = stage
facing = 1
scale = .77,.75

[State 0, Explod]
type = Explod
triggerall = numExplod(8591) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >223
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >223
triggerall = StageVar(info.name) = "SKen"
anim = f211
ID = 8591
pos = 210,-5
sprpriority = -5
space = stage
facing = 1
scale = .77,.75

[State 0, PlaySnd]
type = PlaySnd 
trigger1 = numExplod(8585) = 1
trigger1 = root,HitFall
trigger1 = root,BackEdge <-255
trigger2 = numExplod(8585) = 1
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-255
trigger3 = numExplod(8584) = 1
trigger3 = root,HitFall
trigger3 = root,BackEdge >223
trigger4 = numExplod(8584) = 1
trigger4 = enemy,HitFall
trigger4 = enemy,BackEdge >223
value = f3,1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = root,HitFall
trigger1 = root,BackEdge <-255
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-255
ID = 8585

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = root,HitFall
trigger1 = root,BackEdge >223
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >223
ID = 8584

[State 0, Explod]
type = Explod
trigger1 = time =1
trigger1 = StageVar(info.name) = "SBoss"
anim = f212
ID = 8585
pos = -200,-6
sprpriority = -10
space = stage
facing = -1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8593) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SBoss"
anim = f213
ID = 8593
pos = -200,-6
sprpriority = -5
space = stage
facing = -1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8592) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SBoss"
anim = f214
ID = 8592
pos = -200,-6
sprpriority = -10
space = stage
facing = -1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8591) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SBoss"
anim = f215
ID = 8591
pos = -200,-6
sprpriority = -10
space = stage
facing = -1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8589) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SBoss"
anim = f216
ID = 8589
pos = -200,-6
sprpriority = -10
space = stage
facing = -1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8588) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge <-265
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge <-265
triggerall = StageVar(info.name) = "SBoss"
anim = f217
ID = 8588
pos = -200,-6
sprpriority = -10
space = stage
facing = -1
scale = .62,.78

[State 0, Explod]
type = Explod
trigger1 = time =1
triggerall = StageVar(info.name) = "SBoss"
anim = f212
ID = 8584
pos = 150,-6
sprpriority = -10
space = stage
facing = 1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8572) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SBoss"
anim = f213
ID = 8572
pos = 150,-6
sprpriority = -10
space = stage
facing = 1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8571) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SBoss"
anim = f214
ID = 8571
pos = 150,-6
sprpriority = -10
space = stage
facing = 1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8573) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SBoss"
anim = f215
ID = 8573
pos = 150,-6
sprpriority = -10
space = stage
facing = 1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8579) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SBoss"
anim = f216
ID = 8579
pos = 150,-6
sprpriority = -10
space = stage
facing = 1
scale = .62,.78

[State 0, Explod]
type = Explod
triggerall = numExplod(8575) = 0
trigger1 = root,HitFall
trigger1 = root,BackEdge >233
trigger2 = enemy,HitFall
trigger2 = enemy,BackEdge >233
triggerall = StageVar(info.name) = "SBoss"
anim = f217
ID = 8575
pos = 150,-6
sprpriority = -10
space = stage
facing = 1
scale = .62,.78
;------------------------------------------------------------------------------------------------------------------------------------
[Statedef -2]

[State 0, Explod]
type = Explod
trigger1 = power = 3000
trigger1 = numexplod (53088) < 2
anim = 8011
ID = 53088

[State 0, RemoveExplod]
type = RemoveExplod
trigger1  = power < 3000
id = 53088
;ignorehitpause = 
;persistent = 


[State 0, PlaySnd]
type = PlaySnd
trigger1 = numexplod (53088) = 1
value = F6,2


[State -2]
type = Helper
triggerall = roundstate >= 2
triggerall = !Numhelper(8011)
triggerall = WinKo
triggerall = var(4) = [0,1]
trigger1 = stateno = 2000 || stateno = 2001 || stateno = 2002
trigger2 = stateno = 2003 || stateno = 2004 || stateno = 2005
trigger3 = numhelper(6700) && stateno != 3000
ID = 8011
stateno = 8011
postype = left
pos = 0,0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
ownpal = 1

[State -2, TauntHelper]
type = Helper
triggerall = alive&&Roundstate=2
triggerall = !AILevel
triggerall = command = "start"
triggerall = command != "a"
triggerall = command != "b"
triggerall = command != "c"
triggerall = command != "x"
triggerall = command != "y"
triggerall = command != "z"
triggerall = command != "fwd"
triggerall = command != "back"
triggerall = stateno != [900,999]
trigger1 = numhelper(2992) = 0
helpertype = normal
name = "PauseMenu"
ID = 2992
stateno = 2992
pos = 0, 0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1
;persistent = 0
sprpriority = 3

[State 0, RemapPal]
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,0+palno
ignorehitpause =1
persistent =1

[State 0, RemapPal]
type = RemapPal
trigger1 = 1
source = 1,21
dest = 1,20+palno
ignorehitpause =1
persistent =1

[State -2, default]
type = VarSet
triggerall = Var(51) = 1         ; Partner TAG mode activated
trigger1 = Win || Lose
v = 51
value = 0

; Run into the screen (tagged in, or team won)
[State -2, enter the screen]
type = ChangeState
triggerall = roundstate >= 3		; the match is over
triggerall = stateno = 4512		; Player waiting outside the screen
triggerall = Life		                ; And you're alive
trigger1 = Win
trigger2 = LoseTime
trigger3 = WinTime
value = 4500


[State -2, default]
type = VarSet
triggerall = NumPartner
triggerall = ID > Partner, ID
trigger1 = var(10) = 0
v = 10
value = 1

[State -2, default2]
type = VarSet
triggerall = NumPartner
triggerall = ID < Partner, ID
trigger1 = var(10) = 0
v = 10
value = 2


[State -2, staydead]
type = VarSet
triggerall = NumPartner
trigger1 = (var(10) != 4) && (partner, BackEdgeBodyDist > 0) && (partner, Life) && !(Life) && (roundstate < 1)
v = 10
value = 4

[State -2, Super finish style 1]
type = Explod
triggerall = Win && !WinTime
triggerall = NumExplod(13580) = 0
trigger1 = StateNo = [2000,2999]		;normal ¶W¥²±þ§Þ
trigger2 = StateNo = [3000,3999]		;EX ¶W¥²±þ§Þ
anim = F 40
ID = 13580
sprpriority = -3
postype = left
pos = -30,10
bindtime = -1
supermove = 1
ownpal = 1
removetime = 160
scale = 1,1.2

[State -2,AssertSpecial]
type = AssertSpecial
triggerall = 1
trigger1 = NumExplod(13580) = 1
flag = NoBarDisplay
flag2 = NoBG
flag3 = NoFG
ignorehitpause = 1

[State -2, AssertSpecial]
Type =AssertSpecial
trigger1 = 1
flag = noairguard

;---------------------------------------------------------------------------
;=================== [-2 states] ======================================
[State -2, Var0 set]
;set var(8) is 1 when the round is start
type = VarSet
trigger1 = RoundState < 2        	 ;<--½Ð°Ñ¦Òdata\triggers.txt¤¤ªº»¡©ú
trigger1 = facing = 1
v = 8
value = 1

[State -2, Var0 set]
;set var(8) is 1 when the round is start
type = VarSet
trigger1 = RoundState < 2         	;<--½Ð°Ñ¦Òdata\triggers.txt¤¤ªº»¡©ú
trigger1 = facing = -1
v = 8
value = 2

;AIAIAIAIAI
[State -2, Var0 set]
;set var(14) is 0 when the round is start
type = VarSet
trigger1 = RoundState < 2         	;<--½Ð°Ñ¦Òdata\triggers.txt¤¤ªº»¡©ú
v = 25
value = 0
;AIAIAIAIAI
[State -2, Var0 set]
;set var(14) is 0 when the round is start
type = VarSet
trigger1 = RoundState < 2         	;<--½Ð°Ñ¦Òdata\triggers.txt¤¤ªº»¡©ú
v = 26
value = 0

[State -2, Var0 set]
;set var(14) is 0 when the round is start
type = VarSet
trigger1 = RoundState < 2         	;<--½Ð°Ñ¦Òdata\triggers.txt¤¤ªº»¡©ú
v = 14
value = 0

;L
[State -2, Cap1_L ]	;SF
type = Explod
triggerall = NumExplod(140) = 0
trigger1 = var(8) =1 && var(14) = 0
id = 140
persistent = 0
sprpriority = -2
ontop = 1
anim = F140
pos = 16,213
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

;R
[State -2, Cap1_L ]	;SF
type = Explod
triggerall = NumExplod(140) = 0
trigger1 = var(8) =2 && var(14) = 0
id = 140
persistent = 0
sprpriority = -2
ontop = 1
anim = F140
pos = 243,213
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

;L
;for show groove if 3p also geese/ dont use my pack(mmx) 1350-1361
[State -2, Cap1_L ]	;EX
type = Explod
triggerall = NumExplod(141) = 0
trigger1 = var(8) =1 && var(14) = 1
id = 141
persistent = 0
sprpriority = -2
ontop = 1
anim = F141
pos = 21,213
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

;R
[State -2, Cap1_L ]	;EX
type = Explod
triggerall = NumExplod(141) = 0
trigger1 = var(8) =2 && var(14) = 1
id = 141
persistent = 0
sprpriority = -2
ontop = 1
anim = F141
pos = 248,213
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

[State -2, red fir]
Type = RemoveExplod
Trigger1 = NumExplod(140) = 1 && var(14) = 1
ID = 140
[State -2, red fir]
Type = RemoveExplod
Trigger1 = NumExplod(141) = 1 && var(14) = 0
ID = 141

;POWER ICON
;L
[State -2, Cap1_L ]	;3000
type = Explod
triggerall = NumExplod(3000) = 0
trigger1 = var(8) =1 && power >= 3000
id = 3000
persistent = 0
sprpriority = 5;2
ontop = 1
anim = F3000
pos = 19,225
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

;R
[State -2, Cap1_R ]	;SF
type = Explod
triggerall = NumExplod(3000) = 0
trigger1 = var(8) =2 && power >= 3000
id = 3000
persistent = 0
sprpriority = 5;2
ontop = 1
anim = F3000
pos = 246,225
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

[State -2, red fir]
Type = RemoveExplod
Trigger1 = NumExplod(3000) = 1 && Power < 3000
ID = 3000

;L
[State -2, Cap1_L ]	;2000
type = Explod
triggerall = NumExplod(2000) = 0
trigger1 = var(8) =1 && power >= 2000
id = 2000
persistent = 0
sprpriority = 5;2
ontop = 1
anim = F2000
pos = 19,225
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

;R
[State -2, Cap1_R ]	;SF
type = Explod
triggerall = NumExplod(2000) = 0
trigger1 = var(8) =2 && power >= 2000
id = 2000
persistent = 0
sprpriority = 5;2
ontop = 1
anim = F2000
pos = 246,225
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

[State -2, red fir]
Type = RemoveExplod
Trigger1 = NumExplod(2000) = 1 && ( Power < 2000 || Power >= 3000 )
ID = 2000

;L
[State -2, Cap1_L ]	;1000
type = Explod
triggerall = NumExplod(1000) = 0
trigger1 = var(8) =1 && power >= 1000
id = 1000
persistent = 0
sprpriority = 5;2
ontop = 1
anim = F1000
pos = 19,225
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

;R
[State -2, Cap1_R ]	;SF
type = Explod
triggerall = NumExplod(1000) = 0
trigger1 = var(8) =2 && power >= 1000
id = 1000
persistent = 0
sprpriority = 5;2
ontop = 1
anim = F1000
pos = 246,225
postype = left
ignorehitpause = 1
bindtime = -1
ownpal = 1

[State -2, red fir]
Type = RemoveExplod
Trigger1 = NumExplod(1000) = 1 && ( Power < 1000 || Power >= 2000 )
ID = 1000
;================================================================
[State -2,sound]	;have sound when use  PK
type = PlaySnd
triggerall = animelem = 2
trigger1 = stateno = 200 || stateno = 220 || stateno = 240 || stateno = 260 || stateno = 300 || stateno = 320 || stateno = 340 || stateno = 370 || stateno = 400 || stateno = 440 || stateno = 470 || stateno = 355 || animelem = 385 || animelem = 390
value = F1,1

[State -2,sound]
type = PlaySnd
triggerall = animelem = 2
trigger1 = stateno =  205 || stateno = 245 || stateno =  305 || stateno =  345 || stateno = 375||stateno =  405 || stateno =  445 || stateno =  475
trigger2 = stateno =  225 || stateno = 265 || stateno =  305 || stateno =  325 || stateno = 360 ||stateno =  425 || stateno =  460 || stateno =  490 || stateno = 390 
value = F1,2

[State -2,sound]
type = PlaySnd
triggerall = animelem = 2
trigger1 = stateno =   210 || stateno = 250 || stateno = 250 || stateno = 310 || stateno = 350 || stateno = 380 || stateno = 410 || stateno = 450 || stateno = 480
trigger2 = stateno =   230 || stateno = 270 || stateno = 250 || stateno = 330 || stateno = 365|| stateno = 395|| stateno = 430 || stateno = 465 || stateno = 495
value = F1,3

[State -2, Landing Sound]
type = PlaySnd
triggerall = Time = 1
trigger1 = stateno = 52 
value = F 4,1

;after inamge if not super
[State -2, 1]
type = AfterImageTime
trigger1 = MoveType = H
;trigger2 = StateNo = 52
Time = 0

;when win, then zoom the char.
[State -2,ScreenBound]
type = ScreenBound
triggerall = 1
trigger1 = StateNo = 190
trigger2 = StateNo = 191
value = 0
movecamera = 1, 0

[State -2,turn]
type = turn
trigger1 = statetype !=L && movetype != H  && P2BodyDist X < -30  && ctrl = 1 && stateno = 40
trigger2 = statetype !=L && movetype != H  && P2BodyDist X < -30  && ctrl = 1 && stateno = 52

;
;
;light fire body 8001
;heavy fire body 8000
;light fire body air 8003
;heavy fire body air 8002
;fire body croch 8004
;

;electric
[State -2, electric]
Type = RemoveExplod
Trigger1 = P2StateNo=5100 
ID = 5410
;
[State -2, blue fire]
Type = RemoveExplod
Trigger1 = P2StateNo=5100 
ID = 1102

;DHALSIM and KEN RED FIRE FOR DHALSIM ONLY
[State -2, red fir]
Type = RemoveExplod
Trigger1 = P2StateNo =5100 
ID = 8002
;DHALSIM and KEN RED FIRE FOR DHALSIM ONLY
[State -2, red fir]
Type = RemoveExplod
Trigger1 = P2StateNo =5100 
ID = 8003

;DHALSIM and KEN RED FIRE FOR DHALSIM ONLY
[State -2, 1227]
type = Explod
trigger1 = P2stateno = 1227 && numexplod(8003) = 0 && P2name != "zangief"
anim = 8003
ID = 8003
sprpriority = -1
postype = p2
pos = 0,0
bindtime = -1
supermove = 1
ownpal = 1
removetime = 100
;DHALSIM and KEN RED FIRE FOR DHALSIM ONLY
[State -2, 1227]
type = Explod
trigger1 = P2stateno = 1227 && numexplod(8002) = 0 && P2name = "zangief"
anim = 8002
ID = 8002
sprpriority = -1
postype = p2
pos = 0,0
bindtime = -1
supermove = 1
ownpal = 1
removetime = 100

;DHALSIM and KEN RED FIRE FOR DHALSIM ONLY
[State -2, 1015]
type = Explod
trigger1 = P2stateno = 1015 && numexplod(8002) = 0 && P2name != "zangief"
anim = 8002
ID = 8002
sprpriority = -1
postype = p2
pos = 0,0
bindtime = -1
supermove = 1
ownpal = 1
removetime = 100
;DHALSIM and KEN RED FIRE FOR DHALSIM ONLY
[State -2, 1015]
type = Explod
trigger1 = P2stateno = 1015 && numexplod(8003) = 0 && P2name = "zangief"
anim = 8003
ID = 8003
sprpriority = -1
postype = p2
pos = 0,0
bindtime = -1
supermove = 1
ownpal = 1
removetime = 100

[State -2]
type = Explod
trigger1 = P2stateno = 1104 && numexplod(8002) = 0 && P2name = "EvilRyu"
anim = 8004
ID = 8004
sprpriority = -1
postype = p2
pos = 0,0
bindtime = -1
supermove = 1
ownpal = 1
removetime = 1

;µL¼vthgrow
[State -2, µL¼vthgrow]
type = changestate
trigger1 = P2stateno = 1301 && p2name="guile" && stateno != 13055
value = 13055

;dhalsim super 2000 chnage anim!!!
[State -2, changeanim1]
type = changeAnim
trigger1 = P2stateno = 2001 || P2stateno = 2010 || P2stateno  = 2012 || P2stateno  = 2013 || P2stateno  = 2011 
trigger1 = p2name ="dhalsim" &&  statetype != A
trigger1 = stateno = [5000,5099] 
value = 8001
[State -2, changeanim2]
type = changeAnim
trigger1 = anim = 8001
trigger1 = stateno = 5100
value = 0
[State -2, changeanim3]
type = changeAnim
trigger1 = P2stateno = 2001 || P2stateno = 2010 || P2stateno  = 2012 || P2stateno  = 2013 || P2stateno  = 2011 
trigger1 = p2name ="dhalsim" &&  statetype = A
trigger1 = stateno = [5000,5099] 
value = 8003

;Dhalsim special; frame remove exp
[State -2, flash2]
Type = RemoveExplod
triggerall = name = "dhalsim"
Trigger1 = stateno = [5000, 5999]
trigger2 = movecontact = 1 && stateno = 1100
trigger3 = movecontact = 1 && stateno = 1110
trigger4 = movecontact = 1 && stateno = 1120
ID = 1101

;=====================================================================
;Prevent the P1 char. after gethit in the air then attack P2, or can change the state 5040 state.
[State -2, Ctrlset]
type = ctrlset
triggerall = statetype = A
trigger1 = PrevStateNo = [5000,5105]	;5000, 5105    5040
value = 0

;first att
[State -2, Var5 set]
;set var(5) is 1 when the round is start
type = VarSet
trigger1 = RoundState < 2        
v = 5
value = 0

[State -2, Var6 set]
;set var(6) is 1 when the round is start
type = VarSet
trigger1 = RoundState < 2        
v = 6
value = 0

[State -2, Var5 set]
type = Varadd
trigger1 =  movehit = 1
trigger2 = P2stateno = [5000, 5999]
v = 5
value = 1

[State -2, Var5 set]
type = Varadd
trigger1 = stateno = [5000,5999]
v = 6
value = 1

[State -2,first]
type = Explod
trigger1 = var(5) = 1 && var(6) = 0
trigger1 = numexplod(80) = 0 
trigger1 = var(8) = 1
anim = F80
ID = 80
sprpriority = 10
postype = left
pos = 0,70
bindtime = -1
supermove = 1
ownpal = 1
removetime = 200

[State -2,first]
type = Explod
trigger1 = var(5) = 1 && var(6) = 0
trigger1 = numexplod(80) = 0 
trigger1 = var(8) = 2
anim = F82
ID = 80
sprpriority = 10
postype = left
pos = 320,70
bindtime = -1
supermove = 1
ownpal = 1
removetime = 200

[State -2, recovery]
Type = Explod
Trigger1 = PrevStateNo = 5305 && Time = 1 && stateno = 0
Trigger1 = teamside = 1
Anim = f84
ID = 80
sprpriority = 10
postype = left
pos = 0,70
bindtime = -1
supermove = 1
ownpal = 1
removetime = 200

[State -2, recovery]
Type = Explod
Trigger1 = PrevStateNo = 5305 && Time = 1 && stateno = 0
Trigger1 = teamside = 2
Anim = f86
ID = 80
sprpriority = 10
postype = left
pos = 320,70
bindtime = -1
supermove = 1
ownpal = 1
removetime = 200

[State -2, reversal]
Type = Explod
Trigger1 = MoveReversed
Trigger1 = teamside = 2
Anim = f81
ID = 80
sprpriority = 10
postype = left
pos = 0,70
bindtime = -1
supermove = 1
ownpal = 1
removetime = 200

[State -2, reversal]
Type = Explod
Trigger1 = MoveReversed
Trigger1 = teamside = 1
Anim = f83
ID = 80
sprpriority = 10
postype = left
pos = 320,70
bindtime = -1
supermove = 1
ownpal = 1
removetime = 200

;cannot hit P2 after hit p2 in the air.
[State -2, Nothitby]
type = nothitby
triggerall = statetype = A 
triggerall = PrevStateNo = [5000,5105] 				;5000, 5105    5040
trigger1 = P2name = "ryu" && P2stateno != 345
trigger1 = P2stateno != [2000,2999] 				;for ryu
trigger2 = P2name = "honda" && P2stateno != [2000,2999]
trigger3 = P2name = "ken" && P2stateno != [2000,2999]
trigger4 = P2name = "ken" && P2stateno != [2000,2999]
trigger5 = P2name = "chun li" && P2stateno != [2000,2999]
trigger6 = P2name = "zangief" && P2stateno != [2000,2999]
trigger7 = P2name = "dhalsim" && P2stateno != [2000,2999]
trigger8 = P2name = "guile" && P2stateno != [2000,2999]
trigger9 = P2name = "M.bison" && P2stateno != [2000,2999]
trigger10 = P2name = "sagat" && P2stateno != 1221
trigger10 = P2stateno != [2000,2999] 
trigger11 = P2name = "balrog"  && P2stateno != [2000,2999]
trigger12 = P2name = "vega" && P2stateno != [2000,2999]
trigger13 = P2name = "blanka"  && P2stateno != [2000,2999]
;
trigger14 = P2name = "deejay" && P2stateno != 1311
trigger14 = P2stateno != 1321
trigger14 = P2stateno != 13211
trigger14 = P2stateno != [2000,2999] 	
trigger15 = P2name = "thawk" && P2stateno = [0,999]
trigger16 = P2name = "feilong" && P2stateno = [0,1099]
trigger17 = P2name = "cammy" && P2stateno != [2000,2999]
trigger18 = P2name = "gouki" && P2stateno = [0,999]
value = SCA

[State -2, flash2]
Type = Attackmulset
trigger1 = P2life >= 400
value = 1.4

[State -2, flash2]
Type = Attackmulset
trigger1 = P2life < 400
value = 0.6

;RYU special
[State -2, flash2]
Type = RemoveExplod
Trigger1 = stateno != 2301 && name = "ryu"
ID = 30

[State -2,sound]
type = PlaySnd
triggerall = Win && !WinTime && animtime = 0
trigger1 = StateNo = [2000,2999]		;normal ¶W¥²±þ§Þ
trigger2 = StateNo = [3000,3999]		;EX ¶W¥²±þ§Þ
value = F8,0

; States that are executed when in self's state file (use statedef -3)
;---------------------------------------------------------------------------
;=================== [-3 states] ======================================
[Statedef -3]

[State -3, 8]
type = ChangeState
triggerall = RoundState < 2
triggerall = Var(51)
triggerall = NumPartner
triggerall = ID > Partner,ID
triggerall = StateNo != [4510, 4512]
triggerall = StateNo != [1000, 3000]	; (For assist)
triggerall = StateNo != 4600		; (For assist)
trigger1 = StateNo = 0
trigger1 = Life		                ; And you're alive
trigger2 = AnimTime = 0
trigger2 = Life		                ; And you're alive
value = 4511
ctrl = 0

; TAG

; Run into the screen (tagged in)
[State -3, enter the screen]
type = ChangeState
triggerall = Var(51)        ; Partner TAG mode activated
triggerall = NumPartner
triggerall = stateno = 4512		; Player waiting outside the screen
trigger1 = partner, stateno = 4510	; Partner leaving the screen
trigger1 = Life		                ; And you're alive
value = 4500

; Jump into the screen (partner was KOed)
[State -3, enter the screen]
type = ChangeState
triggerall = Var(51)        ; Partner TAG mode activated
triggerall = NumPartner
trigger1 = StateNo = 4512             ; Player waiting outside the screen
trigger1 = !(Partner, Life)            ; Partner dead
trigger1 = Life		            ; And you're alive
value = 4520

[State -3, wait out of the stage]
type = ChangeState
triggerall = Var(51)        ; Partner TAG mode activated
triggerall = NumPartner
triggerall = ID > Partner,ID
triggerall = partner, stateno != [4510,4512]	; Partner not waiting outside the screen (thus on stage)
triggerall = prevstateno != 0
trigger1 = Time = [0, 1]
trigger1 = RoundState = 2
trigger1 = Partner, Life
trigger1 = Life					; And you're alive
trigger1 = stateno != [4510,4512]		; you're not waiting outside the screen (thus on stage)
value = 4512


[State -3, 8]
type = ChangeState
triggerall = RoundState < 2
triggerall = Var(52)
triggerall = NumPartner
triggerall = ID > Partner,ID
triggerall = StateNo != [4510, 4512]
triggerall = StateNo != [1000, 3000]	; (For assist)
triggerall = StateNo != 4600		; (For assist)
trigger1 = StateNo = 0
trigger1 = Life		                ; And you're alive
trigger2 = AnimTime = 0
trigger2 = Life		                ; And you're alive
value = 4511
ctrl = 0

[State -3, deadcharacter] ;character has died so make sure he doesn't come back alive
type = LifeAdd
triggerall = Numpartner
trigger1 = (var(10) = 4) && (partner, Life) && (life > 0)
value = -1000

[State -2, Velset]
type = Velset
trigger1 = stateno = 52
x = 0

;---------------------------------------------------------------

[State -3, 1]
type = Varset;add
trigger1 = var(32) > 0
trigger1 = time > 50
var(32) = 0;-1
ignorehitpause = 1

[State -3, 1]
type = varadd
trigger1 = var(32) > 0
var(32) = -1
ignorehitpause = 1

[State -3, 2]
type = Varadd
triggerall = Time = 1
triggerall = UniqHitCount <= 1
triggerall = GetHitVar(hitcount) <= 3
trigger1 = anim = 5000 || anim = 5001 || anim = 5002
trigger2 = anim = 5005 || anim = 5006 || anim = 5007
trigger3 = anim = 5020 || anim = 5021 || anim = 5022
var(32) = 30
ignorehitpause = 1

[State -3, 3]
type = Varadd
triggerall = Time = 1
triggerall = UniqHitCount <= 1
triggerall = GetHitVar(hitcount) <= 3
trigger1 = anim = 5010 || anim = 5011 || anim = 5012
trigger2 = anim = 5025 || anim = 5026 || anim = 5027
var(32) = 100
ignorehitpause = 1

[State -3, 4]
type = Varadd
triggerall = Time = 1
triggerall = UniqHitCount <= 1
triggerall = GetHitVar(hitcount) <= 3
trigger1 = anim = 5030
trigger2 = anim = 5040
trigger3 = anim = 5070 
var(32) = 180
ignorehitpause = 1

[State -3, 5]
type = ChangeState
trigger1 = var(32) >= 700
trigger1 = p2stateno != [3000, 3999]
value = 5300
ctrl = 0
ignorehitpause = 1

[State -3, DizzySound Stop]
type = StopSnd
trigger1 = StateNo != [5300, 5305]
trigger2 = P2StateNo = [500, 999]
channel = 2

[State -3, Dizzy]
type = RemoveExplod
trigger1 = stateno != [5300,5350]
trigger2 = P2StateNo = [500, 999]
ID = 4070

;-------------------------------------------------------------------------------------------------------

[State -3];Blood Vomit and Sweat
Type = Explod
Trigger1 = GetHitVar(AnimType) = 2 && (GetHitVar(GroundType)=[1,2]) && StateNo = 5000 && Time = 1 && NumExplod(1) = 0 && Random < 750
Trigger1 = P2StateNo != [1000,3999]
trigger1 = p2dist x < 500
IgnoreHitPause = 0
Anim = IFelse(GetHitVar(GroundType)=1, 71, 73)+(Random<500); + (Var(92)=-1)*10
ID = 1
Pos = 0, 0
PosType = P1
BindTime = -1
SprPriority = 1
RemoveOnGetHit = 1
Scale = Const(Size.XScale), 1

[State -3];
Type = RemoveExplod
Trigger1 = NumExplod(1) = 1 && (MoveType!=H&&StateNo!=[5040,5041])
IgnoreHitPause = 0
ID = 1

[State -3]
Type = Explod
Trigger1 = (StateNo = 151 || StateNo = 153 || StateNo = 5001 || StateNo = 5011) && Time = 1
Anim = 70; + (Var(92)=-1)*10
Pos = 0, 0
PosType = P1
SprPriority = 10
OwnPal = 1
BindTime = -1
Scale = Const(Size.XScale), 1

[State -3];Dust
Type = Explod
Trigger1 = StateNo = 5100
Anim = 75; + (Var(92)=-1)*10
Pos = Floor((-40 + Random/12.5)*Const(Size.XScale)), 0 - Random/50
PosType = P1
Velocity = 0, -3
SprPriority = 10
OwnPal = 1
Scale = Const(Size.XScale), 1

[State -3];Dust
Type = Explod
Trigger1 = StateNo = 5100
Anim = 76; + (Var(92)=-1)*10
Pos = Floor((-40 + Random/80)*Const(Size.XScale)), -120
PosType = P1
Velocity = 0, -2
SprPriority = 10
OwnPal = 1
Scale = Const(Size.XScale), 1

[State -3];Dust
Type = Explod
Trigger1 = StateNo = 5100
Anim = 77; + (Var(92)=-1)*10
Pos = Floor((-40 + Random/5)*Const(Size.XScale)), -170
PosType = P1
Velocity = 0, -2
SprPriority = 10
OwnPal = 1
Scale = Const(Size.XScale), 1

;====================================================================


[State -3, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noairguard
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall= teamside = 1
triggerall= roundno > 1
triggerall= numhelper(5306) = 0
trigger1 = enemy,life < 200
trigger2 = life < 200
name = "heavy damage"
ID = 5306
stateno = 5306
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall= teamside = 1
trigger1= numhelper(5307) = 0
name = "Box"
ID = 5307
stateno = 5307
ignorehitpause = 1

[State 0, PowerSet]
type = PowerSet
trigger1 = roundstate = 1
value = 0

