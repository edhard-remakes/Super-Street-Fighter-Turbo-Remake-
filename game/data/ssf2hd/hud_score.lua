-- Refresh the native HUD record before entering gameplay; no drawing hooks.
local best = 0
for _, mode in pairs((stats and stats.modes) or {}) do
 for _, row in ipairs(mode.ranking or {}) do best = math.max(best, tonumber(row.score) or 0) end
end
local path = "data/fight.def"
local f = io.open(path, "rb")
if f then
 local source = f:read("*a"); f:close()
 local changed = source:gsub("(text%.text%s*=%s*HI%s+)%d+", "%1" .. tostring(math.floor(best)))
 if changed ~= source then
  local w = io.open(path, "wb")
  if w then w:write(changed);w:close();loadLifebar(path) end
 end
end
