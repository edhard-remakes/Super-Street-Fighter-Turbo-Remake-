[Statedef 2000]
type = S
movetype = A
physics = S
ctrl = 0
anim = 1100
velset = 0,0
poweradd = -3000
juggle = 0

[State 2000, Freeze]
type = SuperPause
trigger1 = Time = 0
time = 14
movetime = 0
anim = -1
sound = S19210,0
darken = 0
p2defmul = 1
unhittable = 0

[State 2000, Flash]
type = Explod
trigger1 = Time = 0
anim = 98000
pos = 0,-53
postype = P1
bindtime = -1
ownpal = 1
ontop = 1
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State 2000, Start]
type = ChangeState
trigger1 = Time = 1
value = 2001

[Statedef 2001]
type = S
movetype = A
physics = N
ctrl = 0
anim = 2001
velset = 0,0
juggle = 0

[State 2001, Floor]
type = PosSet
trigger1 = Time = 0
y = 0

[State 2001, Trail]
type = AfterImage
trigger1 = Time = 0
time = 70
trans = none
length = 15
framegap = 4
palcolor = 0
palbright = 1,1,1
palpostbright = -32,-16,170
palcontrast = 176,176,8
paladd = 0,0,0
palmul = .50,.50,.68

[State 2001, Voice]
type = PlaySnd
trigger1 = Time = 0
value = 0,9

[State 2001, Invulnerable]
type = NotHitBy
trigger1 = AnimElemTime(5) <= 0
value = SCA
time = 1

[State 2001, Launch]
type = VelSet
trigger1 = Time = 3
x = 1.4
y = -5

[State 2001, Air]
type = StateTypeSet
trigger1 = Time = 3
statetype = A

[State 2001, Gravity]
type = VelAdd
trigger1 = Time > 3
y = .3

[State 2001, No juggling limit]
type = AssertSpecial
trigger1 = 1
flag = NoJuggleCheck

[State 2001, Hit 1]
type = HitDef
trigger1 = AnimElem = 4
attr = A, HA
hitflag = MAF
air.juggle = 0
hitonce = 0
air.type = High
id = 20010
guardflag = MA
damage = 45,8
getpower = 0,0
givepower = 0,0
pausetime = 8,8
sparkno = S54+TeamSide
guard.sparkno = S54+TeamSide
sparkxy = -20,-38
hitsound = 19002,2
guardsound = 19003,0
animtype = Up
air.animtype = Up
ground.type = High
ground.slidetime = 20
ground.hittime = 35
air.hittime = 35
guard.hittime = 20
ground.velocity = -.5,-3
air.velocity = -.5,-3
guard.velocity = -3
p2stateno = 2005
p2getp1state = 1
fall = 0
air.fall = 0
fall.recover = 0
yaccel = .25
p2facing = 1
kill = ifelse(gamemode = "training", 0, (1))
guard.kill = ifelse(gamemode = "training", 0, (1))
fall.kill = ifelse(gamemode = "training", 0, (1))

[State 2001, Hit 2]
type = HitDef
trigger1 = AnimElem = 5
attr = A, HA
hitflag = MAF
air.juggle = 0
hitonce = 0
air.type = High
id = 20011
guardflag = MA
damage = 45,8
getpower = 0,0
givepower = 0,0
pausetime = 8,8
sparkno = S54+TeamSide
guard.sparkno = S54+TeamSide
sparkxy = -20,-38
hitsound = 19002,2
guardsound = 19003,0
animtype = Up
air.animtype = Up
ground.type = High
ground.slidetime = 20
ground.hittime = 35
air.hittime = 35
guard.hittime = 20
ground.velocity = -.5,-3
air.velocity = -.5,-3
guard.velocity = -3
p2stateno = 2005
p2getp1state = 1
fall = 0
air.fall = 0
fall.recover = 0
yaccel = .25
p2facing = 1
kill = ifelse(gamemode = "training", 0, (1))
guard.kill = ifelse(gamemode = "training", 0, (1))
fall.kill = ifelse(gamemode = "training", 0, (1))

[State 2001, Land]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 2002

[Statedef 2002]
type = S
movetype = A
physics = N
ctrl = 0
anim = 2002
velset = 0,0
juggle = 0

[State 2002, Floor]
type = PosSet
trigger1 = Time = 0
y = 0

[State 2002, Trail]
type = AfterImage
trigger1 = Time = 0
time = 70
trans = none
length = 15
framegap = 4
palcolor = 0
palbright = 1,1,1
palpostbright = -32,-16,170
palcontrast = 176,176,8
paladd = 0,0,0
palmul = .50,.50,.68

[State 2002, Voice]
type = PlaySnd
trigger1 = Time = 0
value = 0,9

[State 2002, Invulnerable]
type = NotHitBy
trigger1 = AnimElemTime(5) <= 0
value = SCA
time = 1

[State 2002, Launch]
type = VelSet
trigger1 = Time = 3
x = 1.4
y = -8

[State 2002, Air]
type = StateTypeSet
trigger1 = Time = 3
statetype = A

[State 2002, Gravity]
type = VelAdd
trigger1 = Time > 3
y = .3

[State 2002, No juggling limit]
type = AssertSpecial
trigger1 = 1
flag = NoJuggleCheck

[State 2002, Hit 1]
type = HitDef
trigger1 = AnimElem = 4
attr = A, HA
hitflag = MAF
air.juggle = 0
hitonce = 0
air.type = High
id = 20020
guardflag = MA
damage = 45,8
getpower = 0,0
givepower = 0,0
pausetime = 8,8
sparkno = S54+TeamSide
guard.sparkno = S54+TeamSide
sparkxy = -20,-38
hitsound = 19002,2
guardsound = 19003,0
animtype = Up
air.animtype = Up
ground.type = High
ground.slidetime = 20
ground.hittime = 35
air.hittime = 35
guard.hittime = 20
ground.velocity = -.5,-3
air.velocity = -.5,-3
guard.velocity = -3
p2stateno = 2005
p2getp1state = 1
fall = 0
air.fall = 0
fall.recover = 0
yaccel = .25
p2facing = 1
kill = ifelse(gamemode = "training", 0, (1))
guard.kill = ifelse(gamemode = "training", 0, (1))
fall.kill = ifelse(gamemode = "training", 0, (1))

[State 2002, Hit 2]
type = HitDef
trigger1 = AnimElem = 5
attr = A, HA
hitflag = MAF
air.juggle = 0
hitonce = 0
air.type = High
id = 20021
guardflag = MA
damage = 45,8
getpower = 0,0
givepower = 0,0
pausetime = 8,8
sparkno = S54+TeamSide
guard.sparkno = S54+TeamSide
sparkxy = -20,-38
hitsound = 19002,2
guardsound = 19003,0
animtype = Up
air.animtype = Up
ground.type = High
ground.slidetime = 20
ground.hittime = 35
air.hittime = 35
guard.hittime = 20
ground.velocity = -.5,-3
air.velocity = -.5,-3
guard.velocity = -3
p2stateno = 2005
p2getp1state = 1
fall = 0
air.fall = 0
fall.recover = 0
yaccel = .25
p2facing = 1
kill = ifelse(gamemode = "training", 0, (1))
guard.kill = ifelse(gamemode = "training", 0, (1))
fall.kill = ifelse(gamemode = "training", 0, (1))

[State 2002, Hit 3]
type = HitDef
trigger1 = AnimElem = 6
attr = A, HA
hitflag = MAF
air.juggle = 0
hitonce = 0
air.type = High
id = 20022
guardflag = MA
damage = 50,8
getpower = 0,0
givepower = 0,0
pausetime = 8,8
sparkno = S54+TeamSide
guard.sparkno = S54+TeamSide
sparkxy = -20,-38
hitsound = 19002,2
guardsound = 19003,0
animtype = Up
air.animtype = Up
ground.type = High
ground.slidetime = 20
ground.hittime = 35
air.hittime = 35
guard.hittime = 20
ground.velocity = -.5,-5
air.velocity = -.5,-5
guard.velocity = -3
p2stateno = 5020
p2getp1state = 0
fall = 1
air.fall = 1
fall.recover = 0
yaccel = .25
p2facing = 1
kill = ifelse(gamemode = "training", 0, (1))
guard.kill = ifelse(gamemode = "training", 0, (1))
fall.kill = ifelse(gamemode = "training", 0, (1))

[State 2002, Land]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 2003

[Statedef 2003]
type = S
movetype = I
physics = S
ctrl = 0
anim = 47
velset = 0,0

[State 2003, Floor]
type = PosSet
trigger1 = Time = 0
y = 0

[State 2003, Trail off]
type = AfterImageTime
trigger1 = Time = 0
time = 0

[State 2003, End]
type = ChangeState
trigger1 = Time >= 7
value = 0
ctrl = 1

[Statedef 2005]
type = A
movetype = H
physics = N
ctrl = 0

[State 2005, Own HD reaction]
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 2005, Lift]
type = VelSet
trigger1 = Time = 0
x = -.25
y = -1.5

[State 2005, Super juggle]
type = VelAdd
trigger1 = 1
y = .08

[State 2005, Failsafe]
type = SelfState
trigger1 = Time > 100
trigger2 = Pos Y >= 0 && Vel Y > 0
value = 5050
