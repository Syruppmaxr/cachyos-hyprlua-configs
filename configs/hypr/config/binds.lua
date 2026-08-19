local mainMod = "SUPER"
local noctCall = "noctalia msg "
local launchPrefix = "uwsm app -- "

-- undefined
hl.bind(mainMod .. " + SLASH", hl.dsp.exec_cmd("hotkeyhub --hyprland"), {description = "Hotkeys cheat sheet"})

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

-- Window manipulation
hl.bind(mainMod .. " + Escape",      hl.dsp.exec_cmd("hyprctl kill"),                    { description = "Kill window" })
hl.bind(mainMod .. " + Q",           hl.dsp.window.close(),                              { description = "Close window" })
hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }),         { description = "Toggle floating" })
hl.bind(mainMod .. " + D",           hl.dsp.window.fullscreen({ mode = 1 }),             { description = "Toggle maximized" })
hl.bind(mainMod .. " + F",           hl.dsp.window.fullscreen(),                          { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + J",           hl.dsp.layout("togglesplit"),                        { description = "Toggle split orientation" })

-- Change focus
hl.bind(mainMod .. " + Left",  hl.dsp.focus({ direction = "left" }),                      { description = "Focus left" })
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }),                     { description = "Focus right" })
hl.bind(mainMod .. " + Up",    hl.dsp.focus({ direction = "up" }),                        { description = "Focus up" })
hl.bind(mainMod .. " + Down",  hl.dsp.focus({ direction = "down" }),                      { description = "Focus down" })
hl.bind("ALT + Tab",           hl.dsp.window.cycle_next(),                                { description = "Cycle windows" })
hl.bind(mainMod .. " + Tab",   hl.dsp.exec_cmd(noctCall .. "window-switcher"),            { description = "Window switcher" })

-- Switch layouts
hl.bind("SUPER + O", function()
    local ws = hl.get_active_workspace()

    if not ws then
        return
    end

    if ws.tiled_layout == "dwindle" then
        hl.workspace_rule({
            workspace = tostring(ws.id),
            layout = "scrolling",
        })
    else
        hl.workspace_rule({
            workspace = tostring(ws.id),
            layout = "dwindle",
        })
    end
end)


-- Move active window around workspaces & monitors
hl.bind(mainMod .. " + SHIFT + Right",           hl.dsp.window.move({ direction = "r" }),      { description = "Move window right" })
hl.bind(mainMod .. " + SHIFT + Left",            hl.dsp.window.move({ direction = "l" }),      { description = "Move window left" })
hl.bind(mainMod .. " + SHIFT + Up",              hl.dsp.window.move({ direction = "u" }),      { description = "Move window up" })
hl.bind(mainMod .. " + SHIFT + Down",            hl.dsp.window.move({ direction = "d" }),      { description = "Move window down" })
hl.bind(mainMod .. " + SHIFT + 1",               hl.dsp.window.move({ monitor = MONITOR1 }),   { description = "Move window to monitor 1" })
hl.bind(mainMod .. " + SHIFT + 2",               hl.dsp.window.move({ monitor = MONITOR2 }),   { description = "Move window to monitor 2" })
hl.bind(mainMod .. " + SHIFT + 3",               hl.dsp.window.move({ monitor = MONITOR3 }),   { description = "Move window to monitor 3" })
hl.bind(mainMod .. " + SHIFT + mouse_up",        hl.dsp.window.move({ monitor = "+1" }),       { description = "Move window to next monitor" })
hl.bind(mainMod .. " + SHIFT + mouse_down",      hl.dsp.window.move({ monitor = "-1" }),       { description = "Move window to previous monitor" })
hl.bind(mainMod .. " + CONTROL + SHIFT + Right", hl.dsp.window.move({ workspace = "r+1" }),    { description = "Move window to next workspace" })
hl.bind(mainMod .. " + CONTROL + SHIFT + Left",  hl.dsp.window.move({ workspace = "r-1" }),    { description = "Move window to previous workspace" })
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(
        mainMod .. " + SHIFT + CONTROL + " .. key,
        hl.dsp.window.move({ workspace = "m~" .. i }),
        { description = "Move window to workspace " .. i }
    )
end

-- Move & Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { description = "Drag window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize window" })

------------------
---- LAUNCHER ----
------------------

hl.bind(mainMod .. " + Return",     hl.dsp.exec_cmd(launchPrefix .. TERMINAL),                        { description = "Open terminal" })
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER),                    { description = "Open file manager" })
hl.bind(mainMod .. " + C",          hl.dsp.exec_cmd(launchPrefix .. EDITOR),                          { description = "Open text editor" })
hl.bind(mainMod .. " + T",         hl.dsp.exec_cmd(launchPrefix .. MD_EDITOR),                       { description = "Open markdown" })
hl.bind(mainMod .. " + SHIFT + C",  hl.dsp.exec_cmd(noctCall .. "panel-toggle noctalia/notes:panel"), { description = "Open Notes"})
hl.bind(mainMod .. " + P",          hl.dsp.exec_cmd("kitty -e ncmpcpp"),                        { description = "Open Ncmpcpp" })
hl.bind(mainMod .. " + W",          hl.dsp.exec_cmd(launchPrefix .. BROWSER),                   { description = "Open browser" })
hl.bind(mainMod .. " + M",          hl.dsp.exec_cmd("steam"),                                   { description = "Open steam" })
hl.bind(mainMod .. " + N",          hl.dsp.exec_cmd("discord"),                                 { description = "discord" })	
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"),    { description = "Open btop" })
hl.bind(mainMod .. " + Z",          hl.dsp.exec_cmd(noctCall .. "settings-toggle"),             { description = "Toggle settings" })
hl.bind(mainMod .. " + X",          hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"), { description = "Toggle control center" })
hl.bind(mainMod .. " + Space",      hl.dsp.exec_cmd(launchPrefix .. LAUNCHER),                  { description = "Open launcher" })
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.exec_cmd(launchPrefix .. LAUNCHER_CAT),               { description = "Open launcher Categories" })
hl.bind(mainMod .. " + period",     hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"),  { description = "Open emoji picker" })
hl.bind(mainMod .. " + L",          hl.dsp.exec_cmd(noctCall .. "session lock"),                { description = "Lock session" })
hl.bind(mainMod .. " + ALT + C",    hl.dsp.exec_cmd(noctCall .. "panel-toggle session"),        { description = "Open session menu" })
---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"), {
    locked = true,
    repeating = true,
    description = "Increase volume"
})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), {
    locked = true,
    repeating = true,
    description = "Decrease volume"
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctCall .. "volume-mute"), {
    locked = true,
    description = "Toggle audio mute"
})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctCall .. "mic-mute"), {
    locked = true,
    description = "Toggle microphone mute"
})

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media toggle"), {
    locked = true,
    description = "Play/Pause media"
})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"), {
    locked = true,
    description = "Play/Pause media"
})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctCall .. "media next"), {
    locked = true,
    description = "Next track"
})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctCall .. "media previous"), {
    locked = true,
    description = "Previous track"
})

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctCall .. "brightness-up"), {
    locked = true,
    repeating = true,
    description = "Increase brightness"
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), {
    locked = true,
    repeating = true,
    description = "Decrease brightness"
})

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind(mainMod .. " + SHIFT + P",     hl.dsp.exec_cmd("hyprpicker -a"),                     { description = "Color picker" })
hl.bind("Print",               hl.dsp.exec_cmd(noctCall .. "screenshot-region"),     { description = "Take region screenshot" })
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen"), { description = "Take fullscreen screenshot" })

-- Theming and Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"), {
    description = "Open wallpaper selector"
})

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"), {
    description = "Open clipboard history"
})

-- Notifications
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications"), {
    description = "Open notifications"
})

-------------------------------
---- WORKSPACES & MONITORS ----
-------------------------------

-- Focus on monitors
hl.bind(mainMod .. " + 1", hl.dsp.focus({ monitor = MONITOR1 }), { description = "Focus monitor 1" })
hl.bind(mainMod .. " + 2", hl.dsp.focus({ monitor = MONITOR2 }), { description = "Focus monitor 2" })
hl.bind(mainMod .. " + 3", hl.dsp.focus({ monitor = MONITOR3 }), { description = "Focus monitor 3" })

-- Focus on workspace number
-- Absolute
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(
        mainMod .. " + TAB + " .. key,
        hl.dsp.focus({ workspace = i }),
        { description = "Focus workspace " .. i }
    )
end

-- Relative
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(
        mainMod .. " + CONTROL + " .. key,
        hl.dsp.focus({ workspace = "m~" .. i }),
        { description = "Focus workspace " .. i .. " on current monitor" }
    )
end

-- Move to adjacent workspaces and next empty on a given monitor
hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.focus({ workspace = "m+1" }),   { description = "Next workspace" })
hl.bind(mainMod .. " + CONTROL + Left",  hl.dsp.focus({ workspace = "m-1" }),   { description = "Previous workspace" })
hl.bind(mainMod .. " + CONTROL + Down",  hl.dsp.focus({ workspace = "emptym" }), { description = "Next empty workspace" })

-- Scroll through existing workspaces & monitors
hl.bind(mainMod .. " + mouse_down",           hl.dsp.focus({ workspace = "m+1" }), { description = "Next workspace" })
hl.bind(mainMod .. " + mouse_up",             hl.dsp.focus({ workspace = "m-1" }), { description = "Previous workspace" })
hl.bind(mainMod .. " + CONTROL + mouse_up",   hl.dsp.focus({ workspace = "m+1" }), { description = "Next workspace" })
hl.bind(mainMod .. " + CONTROL + mouse_down", hl.dsp.focus({ workspace = "m-1" }), { description = "Previous workspace" })

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special" }), { description = "Move window to scratchpad" })
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special(),              { description = "Toggle scratchpad" })
