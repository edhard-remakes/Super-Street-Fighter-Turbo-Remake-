-- Preserve native HD icon pixels; fit each character's icon into its cell.
local sizes={blanka={801,890},dhalsim={851,874},vega={800,813},mbison={818,830},balrog={772,779},zangief={796,899},honda={657,752},thawk={808,780},cammy={796,660},deejay={780,748},sagat={665,684},guile={796,786},ryu={165,160},ken={195,175},feilong={250,237},chunli={1370,1086}}
for _,char in ipairs(main.t_selChars) do
 for name,size in pairs(sizes) do
  if ((char.def or ''):lower():find('ssf2x_'..name..'/',1,true) or (name=='guile' and (char.def or ''):lower():find('guile/',1,true)) or (name=='sagat' and (char.def or ''):lower():find('sagat/',1,true)) or (name=='chunli' and (char.def or ''):lower():find('sf2_chunli/',1,true)) or (name=='dhalsim' and (char.def or ''):lower():find('sf2_dhalsim/',1,true))) and char.cell_data then
   local ratio=main.SP_Viewport43[3]/main.SP_Localcoord[1]
   animSetScale(char.cell_data,23/size[1]/ratio,23/size[2]/ratio,false)
   animUpdate(char.cell_data)
  end
 end
end
local getName=start.f_getName
start.f_getName=function(...)
 return (getName(...) or ''):upper()
end
local selectScreen=start.f_selectScreen
start.f_selectScreen=function(...)
 main.txt_mainSelect:update({text='PLAYER SELECT',x=160,y=173})
 return selectScreen(...)
end


-- Fit complete native portraits inside the reserved display window.
local portraitFit={["ssf2x_blanka"]=0.134831460674,["SF2_dhalsim"]=0.137299771167,["ssf2x_vega"]=0.160427807487,["ssf2x_mbison"]=0.154639175258,["ssf2x_balrog"]=0.173160173160,["ssf2x_zangief"]=0.140023337223,["ssf2x_honda"]=0.147239263804,["SSF2X_THAWK"]=0.179372197309,["ssf2x_cammy"]=0.145530145530,["ssf2x_deejay"]=0.168776371308,["Sagat"]=0.1516793066088841,["ssf2x_ryu"]=0.17076218242399,["ssf2x_ken"]=0.1604696673189824,["ssf2x_feilong"]=0.14999085421620634,["Guile"]=0.14809463608452234,["SF2_chunli"]=0.10218978102189782}
for _,char in ipairs(main.t_selChars) do
 for folder,scale in pairs(portraitFit) do
  if (char.def or ""):lower():find("/"..folder:lower().."/",1,true) then char.portrait_scale=scale end
 end
end

-- Close-up framing of the approved Dhalsim and Chun-Li miniatures.
-- Uniform scale prevents face distortion; each portrait is clipped to its cell.
local closeCells={}
for _,char in ipairs(main.t_selChars) do
 local def=(char.def or ''):lower():gsub('\\','/')
 local spec=nil
 if def:find('/sf2_chunli/',1,true) then spec={1370,1086,.58}
 elseif def:find('/sf2_dhalsim/',1,true) then spec={851,874,.52} end
 if spec and char.cell_data then
  local ratio=main.SP_Viewport43[3]/main.SP_Localcoord[1]
  local zoom=29/spec[2]
  closeCells[char.cell_data]={x=spec[1]*zoom*spec[3]-11.5,y=0}
  animSetScale(char.cell_data,zoom/ratio,zoom/ratio,false)
  animUpdate(char.cell_data)
 end
end
local drawAt=main.f_animPosDraw
main.f_animPosDraw=function(a,x,y,...)
 local crop=closeCells[a]
 if crop then
  animSetWindow(a,x,y,23,23)
  return drawAt(a,x-crop.x,y-crop.y,...)
 end
 return drawAt(a,x,y,...)
end

-- HD training VS screen: show the existing VS screen before practice fights.
local previousVersus=start.f_selectVersus
start.f_selectVersus=function(active,orderSelect,...)
 return previousVersus(active or gamemode('training'),orderSelect,...)
end
-- Native MP4 project opening: keep the original resolution, audio and frame rate.
local previousStoryboard = storyboard.f_storyboard
storyboard.f_storyboard = function(path, attract)
 if (path or ''):lower():gsub('\\','/'):match('abertura%.def$') then
  playBGM('')
  os.remove('data/ssf2hd/video/playback.done')
  os.remove('data/ssf2hd/video/playback.cancel')
  os.execute('wscript.exe //B //NoLogo data/ssf2hd/video/launch_hidden.vbs')
  local deadline = os.time() + 60
  while os.time() < deadline do
   local done = io.open('data/ssf2hd/video/playback.done','r')
   if done then done:close(); break end
   main.f_cmdInput()
   if esc() or main.f_input(main.t_players, {'pal','s','m'}) then
    local cancel = io.open('data/ssf2hd/video/playback.cancel','w')
    if cancel then cancel:write('skip'); cancel:close() end
   end
   clearColor(0,0,0)
   refresh()
  end
  return -- Only the new opening; never replay the old intro.
 end
 return previousStoryboard(path, attract)
end
-- The MP4 is the opening; go directly to it before the title menu.
motif.files.logo_storyboard = ''
-- Replace the old opening entirely.
motif.files.intro_storyboard = 'data/ssf2hd/video/abertura.def'

-- Match the selection cursor to the character's own national flag.
local nationalFlagPositions = {{0.905,0.08},{0.967,0.4},{0.746,0.25},{0.65,0.54},{0.65,0.69},{0.65,0.85},{0.16,0.18},{0.1,0.3},{0.36,0.13},{0.43,0.31},{0.56,0.47},{0.64,0.22},{0.66,0.4},{0.36,0.49},{0.485,0.44}}
local nationalFlagNames = {
 {'ssf2x_ryu',12},{'ssf2x_ken',1},{'feilong',11},{'guile',2},
 {'honda',13},{'chun',10},{'blanka',6},{'cammy',7},{'zangief',9},
 {'dhalsim',14},{'deejay',5},{'dee-jay',5},{'thawk',4},{'t-hawk',4},
 {'vega',8},{'balrog',3},{'sagat',15},{'bison',15},
 {'ryu',12},{'ken',1}
}
local nationalFlagAnimations = {}
local nationalFlagColors = {}
local drawSelectionCursor = start.f_drawCursor
start.f_drawCursor = function(pn,x,y,param)
 drawSelectionCursor(pn,x,y,param)
 local character = start.f_selGrid(y * motif.select_info.columns + x + 1)
 local name = ((character.def or '') .. ' ' .. (character.name or '')):lower()
 local flagIndex = nil
 for _,entry in ipairs(nationalFlagNames) do
  if name:find(entry[1],1,true) then flagIndex=entry[2];break end
 end
 if not flagIndex then return end
 -- Reveal color only under a character/stage cursor; confirmed stage blinks.
 local confirmedStage=start.hdStageDraw and (param or ''):find('done',1,true)
 local showColor=not confirmedStage or getFrameCount()%12<6
 if showColor then
  if not nationalFlagColors[flagIndex] then
   local a=animNew(motif.files.spr_data,'6402,'..flagIndex..',0,0,-1')
   local ratio=main.SP_Viewport43[3]/main.SP_Localcoord[1]
   animSetScale(a,0.149357072/ratio,0.149357072/ratio,false)
   animUpdate(a);nationalFlagColors[flagIndex]=a
  end
  local p=nationalFlagPositions[flagIndex]
  main.f_animPosDraw(nationalFlagColors[flagIndex],160+(p[1]-.5)*302,24+p[2]*778*0.149357072,1)
 end
 local side=(pn-1)%2+1
 local phase=0
 if not (param or ''):find('done',1,true) and getFrameCount()%24>=12 then phase=1 end
 local key=side*10+phase
 if not nationalFlagAnimations[key] then
  local a=animNew(motif.files.spr_data,'6401,'..((side-1)*2+phase)..',0,0,-1')
  local ratio=main.SP_Viewport43[3]/main.SP_Localcoord[1]
  animSetScale(a,0.149357072/ratio,0.149357072/ratio,false)
  animUpdate(a)
  nationalFlagAnimations[key]=a
 end
 local p=nationalFlagPositions[flagIndex]
 main.f_animPosDraw(nationalFlagAnimations[key],160+(p[1]-.5)*302,24+p[2]*778*0.149357072,1)
end

-- Hide the fighters' old cursors while P1 picks the stage through their slots.
local fighterOrStageCursor=start.f_drawCursor
start.f_drawCursor=function(...)
 if start.hdStageChoosing and not start.hdStageDraw then return end
 return fighterOrStageCursor(...)
end

-- Country announcer on stage confirmation (original supplied WAV samples).
local countryAnnouncer=sndNew('data/ssf2hd/countries.snd')
local stageCountryVoice={['stages/thawk.def']={8,55},['stages/deejay.def']={11,55},['stages/cammy.def']={10,55},['stages/bison.def']={7,55},['stages/vega.def']={6,55},['stages/balrog.def']={1,55},['stages/dhalsim.def']={4,55},['stages/zangief.def']={5,55},['stages/blanka.def']={3,55},['stages/honda.def']={0,55},['stages/sagat.def']={7,55},['stages/ryu.def']={0,55},['stages/ken.def']={1,55},['stages/guile.def']={1,55},['stages/feilong.def']={9,47},['stages/chunli.def']={2,55}}
start.hdPlayStageCountry=function(stage)
 local entry=stageCountryVoice[(stage or ''):lower()]
 if not entry then return end
 sndPlay(countryAnnouncer,1000,entry[1])
 start.p[1].screenDelay=math.max(start.p[1].screenDelay or 0,entry[2])
 start.p[2].screenDelay=math.max(start.p[2].screenDelay or 0,entry[2])
end

dofile('data/ssf2hd/classic_menu.lua')

-- Keep every fighter thumbnail inside its own selection square.
local hdCellClip = {}
for _,c in ipairs(main.t_selChars) do if c.cell_data then hdCellClip[c.cell_data] = true end end
local hdDrawCell = main.f_animPosDraw
main.f_animPosDraw = function(a,x,y,...)
 if hdCellClip[a] then animSetWindow(a,x,y,23,23) end
 return hdDrawCell(a,x,y,...)
end
