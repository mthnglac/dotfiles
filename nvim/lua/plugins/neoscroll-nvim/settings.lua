local neoscroll = require("neoscroll")
local last_time = 0
local double_press_duration = 0.3 -- İki basış arasındaki maksimum süre (saniye)
local skip_next_scroll = false

local function pre_hook()
	local current_time = vim.loop.now() / 1000 -- Mevcut zamanı saniye cinsinden al
	if current_time - last_time < double_press_duration then
		-- Eğer iki basış arasındaki süre belirlenen süreden kısa ise, ilk kaydırmayı atla ve daha hızlı kaydır
		skip_next_scroll = true
		neoscroll.setup({
			duration_multiplier = 0.5, -- Kaydırma hızını artır
		})
	else
		-- Aksi takdirde, varsayılan hıza geri dön
		skip_next_scroll = false
		neoscroll.setup({
			duration_multiplier = 1.0,
		})
	end
	last_time = current_time
end

local function post_hook()
	if skip_next_scroll then
		-- İlk kaydırmayı atla
		skip_next_scroll = false
		return false
	end
end

neoscroll.setup({
	mappings = { -- Keys to be mapped to their corresponding default scrolling animation
		"<C-u>",
		"<C-d>",
		"<C-b>",
		"<C-f>",
		"<C-y>",
		"<C-e>",
		"zt",
		"zz",
		"zb",
	},
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = false,
	duration_multiplier = 1.2, -- Global duration multiplier
	easing = "quadratic", -- Default easing function
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
	ignored_events = { -- Events ignored while scrolling
		"WinScrolled",
		"CursorMoved",
	},
	pre_hook = nil,
	post_hook = nil,
})
