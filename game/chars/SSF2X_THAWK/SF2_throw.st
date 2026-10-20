;SF2_thawk

;===========================================
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
attr = S, NT		
getpower = 60
givepower = 20
hitflag = M-			;M-
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

;----------------------------------------------------------------------------
[Statedef 501]
type = S
movetype = A
physics = S
anim = 501
velset = 0, 0
ctrl = 0

;[State 1310,TargetBind]
;type = turn
;trigger1 = time = 0
;persistent = 0 

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 65,0
time = 10
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 30,-40
time = 4
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 0,-50
time = 8
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = -40,-70
time = 4
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 5
pos = 20,-20
time = 2

[State 501,playsnd]
type = playsnd
trigger1 = time = 10
value = 0,4

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
type = ChangeAnim
triggerall = SelfAnimExist(19000505)
Trigger1 = Time = 0 
value = 19000505

[State 910, 0]
type = ChangeAnim2
triggerall = !SelfAnimExist(19000505)
Trigger1 = Time = 0 
value = 505

[State 501,velset]
type = velset
trigger1 = time>= 30
x = -4
y = -6
[State 501,velset]
type = velset
trigger1 = time>= 35
y = -3.5
[State 501,velset]
type = velset
trigger1 = time>= 40
y = -2
[State 501,velset]
type = velset
trigger1 = time>= 45
y = 1
[State 501,velset]
type = velset
trigger1 = time>= 50
y = 3
[State 501,velset]
type = velset
trigger1 = time>= 55
y = 5
[State 501,velset]
type = velset
trigger1 = time>= 60
y = 7

[State 1215,SprPriority]
type = SprPriority
trigger1 = time >= 0
value = -1

[State 911, 1]
type = LifeAdd
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -100

[State 1335,SelfState]
type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100


;===========================================
[Statedef 540]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 500

[State 1200,HitDef]
type = Hitdef
trigger1 = Time = 0 && P2bodydist X <= 25 && P2statetype != A && P2statetype != L && P2movetype != H && statetype != A && P2stateno != 50 && P2stateno != 51 
attr = S, NT		
getpower = 60
givepower = 20
hitflag = M-			;M-
guardflag = -1			;None
priority = 3,miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 541
p2stateno = 545
fall = 1
fall.recover = 0

[State 1200,End]
type = ChangeState
trigger1 = time = 1
value = 205

;----------------------------------------------------------------------------
[Statedef 541]
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
pos = 65,0
time = 10
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 30,-40
time = 4
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 0,-50
time = 8
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = -40,-70
time = 4
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 5
pos = 20,-20
time = 2

[State 501,playsnd]
type = playsnd
trigger1 = time = 10
value = 0,4

[State 1200,End]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------------------
[Statedef 545]
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
type = ChangeAnim
triggerall = SelfAnimExist(19000505)
Trigger1 = Time = 0 
value = 19000505

[State 910, 0]
type = ChangeAnim2
triggerall = !SelfAnimExist(19000505)
Trigger1 = Time = 0 
value = 505

[State 501,velset]
type = velset
trigger1 = time>= 30
x = -4
y = -6
[State 501,velset]
type = velset
trigger1 = time>= 35
y = -3.5
[State 501,velset]
type = velset
trigger1 = time>= 40
y = -2
[State 501,velset]
type = velset
trigger1 = time>= 45
y = 1
[State 501,velset]
type = velset
trigger1 = time>= 50
y = 3
[State 501,velset]
type = velset
trigger1 = time>= 55
y = 5
[State 501,velset]
type = velset
trigger1 = time>= 60
y = 7

[State 1215,SprPriority]
type = SprPriority
trigger1 = time >= 0
value = -1

[State 911, 1]
type = LifeAdd
trigger1 = Vel Y > 0 && Pos Y >= 0
value = -100

[State 1335,SelfState]
type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100


;===========================================
[Statedef 510]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 510

[State 1200,HitDef]
type = Hitdef
trigger1 = Time = 0 && P2bodydist X <= 25 && P2statetype != A && P2statetype != L && P2movetype != H && statetype != A && P2stateno != 50 && P2stateno != 51 
attr = S, NT		
getpower = 60
givepower = 20
hitflag = M-			;M-
guardflag = -1			;None
priority = 3,miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 511
p2stateno = 515
fall = 1
fall.recover = 0

[State 1200,End]
type = ChangeState
trigger1 = time = 1
value = 210

;----------------------------------------------------------------------------
[Statedef 511]
type = S
movetype = A
physics = S
anim = 511
velset = 0, 0
ctrl = 0

;[State 1310,TargetBind]
;type = turn
;trigger1 = time = 0
;persistent = 0 

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 30,-125
time = 150
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 11
pos = 30,0
time = 1

[State 911, 1]
type = Playsnd
Trigger1 = anim = 513
Trigger1 = command = "z"
Trigger2 = anim = 511
Trigger2 = command = "z"
value = 0,4

[State 911, 1]
type = Playsnd
Trigger1 = anim = 513
Trigger1 = command = "z"
Trigger2 = anim = 511
Trigger2 = command = "z"
value = f2,6

[State 911, 1]
type = Changeanim
Trigger1 = anim = 513
Trigger1 = command = "z"
Trigger2 = anim = 511
Trigger2 = command = "z"
value = 512

[State 911, 1]
type = Changeanim
Trigger1 = anim = 512
Trigger1 = animtime = 0
value = 513

[State 1200,End]
type = ChangeState
trigger1 =  time = 255 
value = 0
ctrl = 1

;----------------------------------------------------------------------------
[Statedef 515]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

;[State 1310,TargetBind]
;type = turn
;trigger1 = time = 0
;persistent = 0 

[State 910, 0]
type = ChangeAnim
triggerall = SelfAnimExist(19000515)
Trigger1 = Time = 0 
value = 19000515

[State 910, 0]
type = ChangeAnim2
triggerall = !SelfAnimExist(19000515)
Trigger1 = Time = 0 
value = 515

[State 1215,SprPriority]
type = SprPriority
trigger1 = time >= 0
value = -1

[State 911, 1]
type = velset
Trigger1 = time >= 255
x = -4
y = -5
[State 911, 1]
type = velset
Trigger1 = time >= 258
y = -3
[State 911, 1]
type = velset
Trigger1 = time >= 260
y = -1
[State 911, 1]
type = velset
Trigger1 = time >= 265
y = 2
[State 911, 1]
type = velset
Trigger1 = time >= 270
y = 4
[State 911, 1]
type = velset
Trigger1 = time >= 275
y = 6
[State 911, 1]
type = velset
Trigger1 = time >= 285
y = 8


[State 910, 0]
type = ChangeAnim
Trigger1 = time = 255
value = 41

[State 0, ChangeAnim2]
type = ChangeAnim
triggerall = SelfAnimExist(19000516)
trigger1 = enemy,anim = 512
trigger1 = enemy,animelem = 1
value = 19000516

[State 0, ChangeAnim2]
type = ChangeAnim2
triggerall = !SelfAnimExist(19000516)
trigger1 = enemy,anim = 512
trigger1 = enemy,animelem = 1
value = 516

[State 911, 1]
type = ChangeAnim
triggerall = SelfAnimExist(19000517)
Trigger1 = (anim = 516 || anim = 19000516)
Trigger1 = animtime = 0
value = 19000517

[State 911, 1]
type = Changeanim2
triggerall = !SelfAnimExist(19000517)
Trigger1 = (anim = 516 || anim = 19000516)
Trigger1 = animtime = 0
value = 517

[State 1215,ChangeState]
type = lifeadd
Trigger1 = enemy,anim = 512
Trigger1 = enemy,animelem = 1
value = -30


[State 1335,SelfState]
type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = ifelse(SelfStateNoExist(52),52,0)
ctrl = 1

;===========================================
[Statedef 520]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 520

[State 1200,HitDef]
type = Hitdef
trigger1 = Time = 0 && P2bodydist X <= 25 && P2statetype != A && P2statetype != L && P2movetype != H && statetype != A && P2stateno != 50 && P2stateno != 51 
attr = S, NT		
getpower = 60
givepower = 20
hitflag = M-			;M-
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

;----------------------------------------------------------------------------
[Statedef 521]
type = S
movetype = A
physics = S
anim = 521
velset = 0, 0
ctrl = 0

;[State 1310,TargetBind]
;type = turn
;trigger1 = time = 0
;persistent = 0 

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 30,-70
time = 150

[State 911, 1]
type = Playsnd
Trigger1 = anim = 523
Trigger1 = command = "c"
Trigger2 = anim = 521
Trigger2 = command = "c"
value = 0,4

[State 911, 1]
type = Playsnd
Trigger1 = anim = 523
Trigger1 = command = "c"
Trigger2 = anim = 521
Trigger2 = command = "c"
value = F2,6

[State 911, 1]
type = Changeanim
Trigger1 = anim = 523
Trigger1 = command = "c"
Trigger2 = anim = 521
Trigger2 = command = "c"
value = 522

[State 911, 1]
type = Changeanim
Trigger1 = anim = 522
Trigger1 = animtime = 0
value = 523

[State 1200,End]
type = ChangeState
trigger1 = time = 255 
value = 0
ctrl = 1

;----------------------------------------------------------------------------
[Statedef 525]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

;[State 1310,TargetBind]
;type = turn
;trigger1 = time = 0
;persistent = 0 

[State 910, 0]
type = ChangeAnim
triggerall = SelfAnimExist(19000525)
Trigger1 = Time = 0 
value = 19000525

[State 910, 0]
type = ChangeAnim2
triggerall = !SelfAnimExist(19000525)
Trigger1 = Time = 0 
value = 525

[State 1215,SprPriority]
type = SprPriority
trigger1 = time >= 0
value = -1

[State 911, 1]
type = velset
Trigger1 = time >= 256
x = -2.5
y = -3
[State 911, 1]
type = velset
Trigger1 = time >= 260
y = -2
[State 911, 1]
type = velset
Trigger1 = time >= 265
y = 0
[State 911, 1]
type = velset
Trigger1 = time >= 270
y = 2
[State 911, 1]
type = velset
Trigger1 = time >= 275
y = 4
[State 911, 1]
type = velset
Trigger1 = time >= 285
y = 6
[State 911, 1]
type = velset
Trigger1 = time >= 295
y = 8



[State 910, 0]
type = ChangeAnim
Trigger1 = time = 256
value = 41


[State 0, ChangeAnim2]
type = ChangeAnim
triggerall = SelfAnimExist(19000526)
trigger1 = enemy,anim = 522
trigger1 = enemy,animelem = 1
value = 19000526

[State 0, ChangeAnim2]
type = ChangeAnim2
triggerall = !SelfAnimExist(19000526)
trigger1 = enemy,anim = 522
trigger1 = enemy,animelem = 1
value = 526

[State 911, 1]
type = ChangeAnim
triggerall = SelfAnimExist(19000527)
Trigger1 = (anim = 526 || anim = 19000526)
Trigger1 = animtime = 0
value = 19000527

[State 911, 1]
type = Changeanim2
triggerall = !SelfAnimExist(19000527)
Trigger1 = (anim = 526 || anim = 19000526)
Trigger1 = animtime = 0
value = 527

[State 1215,ChangeState]
type = lifeadd
Trigger1 = enemy,anim = 522
Trigger1 = enemy,animelem = 1
value = -30

[State 1335,SelfState]
type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = ifelse(SelfStateNoExist(52),52,0)
ctrl = 1