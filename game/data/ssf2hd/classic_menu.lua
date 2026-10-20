-- Classic HD front end. Native selection and battle flows remain the engine's.
local sizes={{1280,530},{1551,118},{1089,112},{1086,110},{593,110},{598,168},{1086,1448}}
local art={}
local ratio=main.SP_Viewport43[3]/main.SP_Localcoord[1]
for n=0,6 do
 art[n]=animNew(motif.files.spr_data,'6600,'..n..',0,0,-1')
 animUpdate(art[n])
end
local function picture(n,x,y,sx,sy)
 animSetScale(art[n],sx/ratio,(sy or sx)/ratio,false)
 main.f_animPosDraw(art[n],x,y,1,true)
end
local txt=text:create({font=motif.files.font[7],bank=0,align=1,scaleX=.037,scaleY=.057,r=255,g=255,b=255})
local function label(s,x,y,align,color,scale)
 color=color or {255,255,255}
 local bank=color[2]==235 and 1 or (color[2]==75 and 2 or 0)
 txt:update({bank=bank,text=s,x=x,y=y,align=align or 1,r=color[1],g=color[2],b=color[3],scaleX=scale or .037,scaleY=.057})
 txt:draw()
end
local keys={'arcade','versus','training','options'}
local entries={}
for i,k in ipairs(keys) do entries[i]={itemname=k} end
local red={255,75,70};local yellow={255,235,30};local blue={30,80,255}
local function sound(confirm)
 local p=confirm and motif.title_info.cursor_done_snd or motif.title_info.cursor_move_snd
 sndPlay(motif.files.snd_data,p[1],p[2])
end
local function titleDraw(selected,scroll,gate,tick)
 clearColor(0,0,0)
 picture(0,0,25,.25)
 if gate then
  if tick%60<42 then picture(1,160-1551*.09/2,170,.09) end
 else
  for i=1,4 do
   local y=183+(i-1)*22-scroll
   if y>161 and y<216 then
    local n=i+1;local scale=.112
    if i==4 then scale=.112 end
    if i~=selected then animSetPalFX(art[n],{time=-1,mul={30,80,255}}) else animSetPalFX(art[n],{time=-1,mul={256,256,256}}) end
    picture(n,160-sizes[n+1][1]*scale/2,y,scale)
   end
  end
 end
end
local tick=0
local function optionDraw(row,pn)
 tick=tick+1
 clearColor(0,0,100)
 local h=240;local y=(tick*.15)%h
 animSetPalFX(art[6],{time=-1,mul={145,145,145}})
 picture(6,0,y,320/1086,h/1448);picture(6,0,y-h,320/1086,h/1448)
 label('OPTION MODE',160,29,0,nil,.045)
 label('EASY',190,53,0);label('HARD',272,53,0)
 label('DIFFICULTY',18,70,1,row==1 and red or nil)
 for i=1,8 do label('*',180+i*12,70,0,i<=config.Difficulty and yellow or nil) end
 label('TIME LIMIT',18,94,1,row==2 and red or nil)
 label('YES',207,94,0,config.RoundTime~=-1 and yellow or nil)
 label('NO',280,94,0,config.RoundTime==-1 and yellow or nil)
 label('CONFIG.',18,116);label('1PLAYER',207,116,0);label('2PLAYER',280,116,0)
 local names={'L.PUNCH','M.PUNCH','H.PUNCH','L.KICK','M.KICK','H.KICK'}
 local indices={8,9,10,5,6,7}
 for i,name in ipairs(names) do
  label(name,45,127+i*10,1,row==i+2 and red or nil)
  for p=1,2 do
   local val=tostring(config.KeyConfig[p].Buttons[indices[i]]):upper()
   label(val, p==1 and 207 or 280,127+i*10,0,row==i+2 and pn==p and yellow or nil,.028)
  end
 end
 label('CPS FIGHTER',18,207,1,row==9 and red or nil)
 for p=1,2 do label('SET',p==1 and 207 or 280,207,0,row==9 and pn==p and yellow or nil) end
 label('STEREO',18,229,1,row==10 and red or nil)
 label('STEREO',207,229,0,config.StereoEffects and yellow or nil,.028)
 label('MONAURAL',280,229,0,not config.StereoEffects and yellow or nil,.028)
end
local function capture(pn,index)
 main.f_cmdBufReset();resetKey();local released=false;local age=0
 while true do
  tick=tick+1;age=age+1;optionDraw(9,pn)
  label(({'UP','DOWN','LEFT','RIGHT','L.KICK','M.KICK','H.KICK','L.PUNCH','M.PUNCH','H.PUNCH','START'})[index]..' '..pn,160,17,0,yellow,.036)
  if esc() then esc(false);main.f_cmdBufReset();return false end
  local key=getKey();local joy=getJoystickKey(config.JoystickConfig[pn].Joystick)
  if tonumber(joy)==nil then released=true end
  if age>12 and key~='' then
   config.KeyConfig[pn].Buttons[index]=key
   setKeyConfig(pn,config.KeyConfig[pn].Joystick,config.KeyConfig[pn].Buttons)
   resetKey();main.f_cmdBufReset();return true
  elseif age>12 and released and tonumber(joy)~=nil then
   config.JoystickConfig[pn].Buttons[index]=tostring(joy)
   setKeyConfig(pn,config.JoystickConfig[pn].Joystick,config.JoystickConfig[pn].Buttons)
   main.f_cmdBufReset();return true
  end
  refresh()
 end
end
local function optionsLoop()
 local row,pn=1,1;main.f_cmdBufReset()
 while true do
  tick=tick+1;main.f_cmdInput();optionDraw(row,pn)
  if esc() then esc(false);options.f_saveCfg(false);main.f_cmdBufReset();return end
  if main.f_input(main.t_players,{'$D'}) then row=row%10+1;sound(false) end
  if main.f_input(main.t_players,{'$U'}) then row=(row+8)%10+1;sound(false) end
  local left=main.f_input(main.t_players,{'$B'});local right=main.f_input(main.t_players,{'$F'})
  local confirm=main.f_input(main.t_players,{'pal','s'})
  if left or right or confirm then
   if row==1 then config.Difficulty=math.max(1,math.min(8,config.Difficulty+(left and -1 or 1)))
   elseif row==2 then config.RoundTime=config.RoundTime==-1 and 99 or -1
   elseif row>=3 and row<=9 then
    if left or right then pn=3-pn end
    if confirm then
     if row==9 then for i=1,11 do if not capture(pn,i) then break end end
     else capture(pn,({8,9,10,5,6,7})[row-2]) end
    end
   else config.StereoEffects=not config.StereoEffects;setStereoEffects(config.StereoEffects) end
   sound(confirm)
  end
  refresh()
 end
end
main.hdClassicDraw=titleDraw;main.hdOptionsDraw=optionDraw
main.t_itemname.options=function() return optionsLoop end
local previousMenu=main.menu.loop
main.menu.loop=function(...)
 if main.hdClassicProbe then return main.hdClassicProbe() end
 for _, modulePath in ipairs(config.Modules) do
  if modulePath ~= 'data/ssf2hd/hud_score.lua' then return previousMenu(...) end
 end
 if motif.files.intro_storyboard~='' then storyboard.f_storyboard(motif.files.intro_storyboard) end
 main.f_bgReset(motif.titlebgdef.bg);main.f_playBGM(true,motif.music.title_bgm,motif.music.title_bgm_loop,motif.music.title_bgm_volume,motif.music.title_bgm_loopstart,motif.music.title_bgm_loopend);main.f_cmdBufReset()
 local gate=true;local selected=1;local scroll=0
 while true do
  tick=tick+1;main.f_cmdInput()
  scroll=scroll+((selected-1)*22-scroll)*.25
  titleDraw(selected,scroll,gate,tick)
  if esc() then esc(false);gate=true;main.f_cmdBufReset() end
  if not gate then
   if main.f_input(main.t_players,{'$D'}) then selected=selected%4+1;sound(false) end
   if main.f_input(main.t_players,{'$U'}) then selected=(selected+2)%4+1;sound(false) end
  end
  if main.f_input(main.t_players,{'pal','s'}) then
   sound(true)
   if gate then gate=false;main.f_cmdBufReset()
   else
    main.f_default()
    local callback=main.t_itemname[keys[selected]](entries,selected)
    if callback then callback() end
    main.f_default();main.f_bgReset(motif.titlebgdef.bg);main.f_playBGM(true,motif.music.title_bgm,motif.music.title_bgm_loop,motif.music.title_bgm_volume,motif.music.title_bgm_loopstart,motif.music.title_bgm_loopend);main.f_cmdBufReset()
   end
  end
  refresh()
 end
end

