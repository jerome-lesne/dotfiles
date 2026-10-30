-- Hyprland 0.56.2 Lua configuration
-- Converted from hyprland.conf

-------------------------
-- ENVIRONMENT VARIABLES
-------------------------
hl.env("GDK_SCALE", "1")
hl.env("GDK_DPI_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

hl.env("XCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures/Screenshots")

------------
-- MONITORS
------------
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto", scale = 1 })

-------------
-- PROGRAMS
-------------
local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "rofi -show drun -show-icons"
local browser = "firefox"
local lock = "hyprlock"

-------------
-- AUTOSTART
-------------
hl.on("hyprland.start", function()
	hl.exec_cmd("hypridle")
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	hl.exec_cmd(terminal)
	hl.exec_cmd("waybar")
	hl.exec_cmd("syncthing")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/wallpaper-rotate.sh")
	hl.exec_cmd("nextcloud")
	hl.exec_cmd('sh -c "sleep 3 && keepassxc"')
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("blueman-applet")
end)

---------------
-- PERMISSIONS
---------------
-- Keep permissions disabled, as in your original configuration.
-- To opt in, uncomment the following lines:
-- hl.config({ ecosystem = { enforce_permissions = true } })
-- hl.permission({ binary = "/usr/(bin|local/bin)/grim", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })

-----------------
-- LOOK AND FEEL
-----------------
hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 6,
		border_size = 2,
		col = {
			active_border = {
				colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 6,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},
})

---------
-- INPUT
---------
hl.config({
	input = {
		kb_layout = "fr",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",
		follow_mouse = 0,
		sensitivity = 0.4,
		repeat_delay = 200,
		repeat_rate = 40,
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.device({ name = "epic-mouse-v1", sensitivity = 0 })

-----------------------
-- LID SWITCH BEHAVIOR
-----------------------
-- Only turn off the laptop display if another display is active.
-- Unlike the old 'hyprctl keyword monitor', this uses the Lua API directly.
hl.bind("switch:on:Lid Switch", function()
	for _, monitor in ipairs(hl.get_monitors()) do
		if monitor.name ~= "eDP-1" then
			hl.monitor({ output = "eDP-1", disabled = true })
			break
		end
	end
end, { locked = true })

-- Always re-enable the laptop display when the lid opens.
hl.bind("switch:off:Lid Switch", function()
	hl.monitor({
		output = "eDP-1",
		mode = "preferred",
		position = "auto",
		scale = 1,
		disabled = false,
	})
end, { locked = true })

---------------
-- KEYBINDINGS
---------------
local mainMod = "ALT"

hl.bind("SUPER + L", hl.dsp.exec_cmd(lock))

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))

-- Move focus using ALT + SHIFT + H/J/K/L.
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.focus({ direction = "down" }))

-- French AZERTY workspace keys (1 through 10).
local workspaceKeys = {
	"ampersand",
	"eacute",
	"quotedbl",
	"apostrophe",
	"parenleft",
	"minus",
	"egrave",
	"underscore",
	"ccedilla",
	"agrave",
}

for workspace, key in ipairs(workspaceKeys) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

-- Special workspace / scratchpad.
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Drag to move/resize windows with the mouse.
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia controls: repeat while held and work on the lockscreen.
local mediaFlags = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), mediaFlags)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), mediaFlags)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), mediaFlags)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), mediaFlags)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), mediaFlags)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), mediaFlags)

-- Player controls: work while locked, without repeating.
local lockedFlags = { locked = true }
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), lockedFlags)
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), lockedFlags)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), lockedFlags)
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), lockedFlags)

hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures"))

--------------------------
-- WINDOWS AND WORKSPACES
--------------------------
for workspace = 1, 5 do
	hl.workspace_rule({ workspace = tostring(workspace), persistent = true })
end

hl.bind(mainMod .. " + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ workspace = "e-1" }))

-- Initial workspace assignments.
hl.window_rule({ match = { class = "obsidian" }, workspace = "2" })
hl.window_rule({ match = { class = ".*ghostty.*" }, workspace = "3" })
hl.window_rule({ match = { class = "zen" }, workspace = "4" })

-- Thunar opacity.
hl.window_rule({ match = { class = "thunar" }, opacity = "0.9 0.85" })

-- Ignore maximize requests from apps.
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Avoid focus problems with XWayland drag surfaces.
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})
