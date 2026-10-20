;SF2_DJ
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
value = 225

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
value = 230

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
pos = 0,0
time = 3
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 0,0
time =14
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 0,0
time = 6
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = 0,-30
time = 5
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 5
pos = -30,-30
time = 4

[State 501,playsnd]
type = playsnd
trigger1 = time = 10
value = 70,0

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
type = ChangeAnim
Trigger1 = Time = 0 
value = 11300505

[State 501,velset]
type = velset
trigger1 = time>= 33
x = 4
y = -3
[State 501,velset]
type = velset
trigger1 = time>= 38
y = -2
[State 501,velset]
type = velset
trigger1 = time>= 43
y = -1
[State 501,velset]
type = velset
trigger1 = time>= 48
y = 1
[State 501,velset]
type = velset
trigger1 = time>= 53
y = 3
[State 501,velset]
type = velset
trigger1 = time>= 58
y = 5
[State 501,velset]
type = velset
trigger1 = time>= 63
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
value = 225

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
value = 230

;----------------------------------------------------------------------------
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
pos = 0,0
time = 3
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 0,0
time =14
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 0,0
time = 6
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = 0,-30
time = 5
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 5
pos = -30,-30
time = 4

[State 501,playsnd]
type = playsnd
trigger1 = time = 10
value = 70,0

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
type = ChangeAnim
Trigger1 = Time = 0 
value = 11300505

[State 501,velset]
type = velset
trigger1 = time>= 33
x = 4
y = -3
[State 501,velset]
type = velset
trigger1 = time>= 38
y = -2
[State 501,velset]
type = velset
trigger1 = time>= 43
y = -1
[State 501,velset]
type = velset
trigger1 = time>= 48
y = 1
[State 501,velset]
type = velset
trigger1 = time>= 53
y = 3
[State 501,velset]
type = velset
trigger1 = time>= 58
y = 5
[State 501,velset]
type = velset
trigger1 = time>= 63
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

;===========================================
[Statedef 550]
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
value = 210

;----------------------------------------------------------------------------
[Statedef 541]
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
pos = 20,-10
time =4
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 0,-30
time =10
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = -50,-50
time = 5
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = -60,-30
time = 4
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 5
pos = -40,-40
time = 3

[State 501,playsnd]
type = playsnd
trigger1 = time = 10
value = 70,0

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
[Statedef 545]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 910, 0]
type = ChangeAnim
Trigger1 = Time = 0 
value = 11300525

[State 501,velset]
type = velset
trigger1 = time>= 27
x = 4
y = -3
[State 501,velset]
type = velset
trigger1 = time>= 32
y = -2
[State 501,velset]
type = velset
trigger1 = time>= 37
y = -1
[State 501,velset]
type = velset
trigger1 = time>= 42
y = 1
[State 501,velset]
type = velset
trigger1 = time>= 47
y = 3
[State 501,velset]
type = velset
trigger1 = time>= 52
y = 5
[State 501,velset]
type = velset
trigger1 = time>= 57
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
[Statedef 560]
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
p1stateno = 561
p2stateno = 565
fall = 1
fall.recover = 0

[State 1200,End]
type = ChangeState
trigger1 = time = 1
value = 205

;===========================================
[Statedef 570]
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
p1stateno = 561
p2stateno = 565
fall = 1
fall.recover = 0

[State 1200,End]
type = ChangeState
trigger1 = time = 1
value = 210

;----------------------------------------------------------------------------
[Statedef 561]
type = S
movetype = A
physics = S
anim = 521
velset = 0, 0
ctrl = 0

[State 1310,TargetBind]
type = turn
trigger1 = time = 0
persistent = 0 

[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 1
pos = 20,-10
time =4
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 2
pos = 0,-30
time =10
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = -50,-50
time = 5
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 4
pos = -60,-30
time = 4
[State 1310,TargetBind]
type = TargetBind
trigger1 = AnimElem = 5
pos = -40,-40
time = 3

[State 501,playsnd]
type = playsnd
trigger1 = time = 10
value = 70,0

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
[Statedef 565]
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
Trigger1 = Time = 0 
value = 11300525

[State 501,velset]
type = velset
trigger1 = time>= 27
x = 4
y = -3
[State 501,velset]
type = velset
trigger1 = time>= 32
y = -2
[State 501,velset]
type = velset
trigger1 = time>= 37
y = -1
[State 501,velset]
type = velset
trigger1 = time>= 42
y = 1
[State 501,velset]
type = velset
trigger1 = time>= 47
y = 3
[State 501,velset]
type = velset
trigger1 = time>= 52
y = 5
[State 501,velset]
type = velset
trigger1 = time>= 57
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


