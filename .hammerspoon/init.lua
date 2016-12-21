local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      -- hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      -- hs.timuer.usleep(1000)
      -- hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
      hs.eventtap.keyStroke(modifiers, string.lower(key))
   end
end
local function shiftKey(char)
  return function()
    hs.eventtap.keyStroke({'shift'}, string.lower(char))
  end
end
local function SandS(tapEvent)
  _G.SandS = true
  local char = hs.keycodes.map[tapEvent:getKeyCode()]
  -- hs.eventtap.keyStroke({'shift'}, string.lower(char))
  hs.hotkey.bind({}, char, shiftKey(char), nil, shiftKey(char))
end
local keyTap = hs.eventtap.new(
  {hs.eventtap.event.types.keyDown},
  SandS
)
local function SandS_press(key)
  --hs.alert.show("press")
  _G.SandS = false
  return keyTap:start()
end
local function SandS_release(key)
  --hs.alert.show("release")
  if _G.SandS == false then
    hs.eventtap.keyStroke({}, 'space')
  end
  return keyTap:stop()
end
local function repeatKey()
  --hs.alert.show("repeat")
  --hs.eventtap.keyStroke({}, 'space')
  return keyCode('space')
end
hs.hotkey.bind({}, 'space', keyTap:start(), keyTap:stop(), repeatKey)

--[[
local function showKeyPress(tapEvent)
    local charactor = hs.keycodes.map[tapEvent:getKeyCode()]
    hs.alert.show(charactor, 1.5)
end

local keyTap = hs.eventtap.new(
  {hs.eventtap.event.types.keyDown},
  showKeyPress
)

k = hs.hotkey.modal.new({}, 'space')
function k:entered()
  hs.alert.show("Enabling Keypress Show Mode", 1.5)
  keyTap:start()
end
function k:exited()
  hs.alert.show("Disabling Keypress Show Mode", 1.5)
end
k:bind({"cmd", "shift", "ctrl"}, 'P', function()
    keyTap:stop()
    k:exit()
end)
]]--
--[[
local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function disableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:disable()
   end
end

local function enableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:enable()
   end
end

local function handleGlobalAppEvent(name, event, app)
   if event == hs.application.watcher.activated then
      -- hs.alert.show(name)
      if name ~= "iTerm2" then
         enableAllHotkeys()
      else
         disableAllHotkeys()
      end
   end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

-- カーソル移動
remapKey({'ctrl'}, 'f', keyCode('right'))
remapKey({'ctrl'}, 'b', keyCode('left'))
remapKey({'ctrl'}, 'n', keyCode('down'))
remapKey({'ctrl'}, 'p', keyCode('up'))

-- テキスト編集
remapKey({'ctrl'}, 'w', keyCode('x', {'cmd'}))
remapKey({'ctrl'}, 'y', keyCode('v', {'cmd'}))

-- コマンド
remapKey({'ctrl'}, 's', keyCode('f', {'cmd'}))
remapKey({'ctrl'}, '/', keyCode('z', {'cmd'}))
remapKey({'ctrl'}, 'g', keyCode('escape'))

-- ページスクロール
remapKey({'ctrl'}, 'v', keyCode('pagedown'))
remapKey({'alt'}, 'v', keyCode('pageup'))
remapKey({'cmd', 'shift'}, ',', keyCode('home'))
remapKey({'cmd', 'shift'}, '.', keyCode('end'))
]]--
