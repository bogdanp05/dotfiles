local status, lualine = pcall(require, "lualine")

if not status then
	return
end

-- https://www.reddit.com/r/neovim/comments/w9lva4/how_to_put_this_in_lualine_image_from_vimairline/
local function searchCount()
	-- maxcount = 0 makes the number not be capped at 99
	local search = vim.fn.searchcount({ maxcount = 0 })
	local searchCurrent = search.current
	local searchTotal = search.total
	if searchCurrent > 0 and vim.v.hlsearch ~= 0 then
		return "/" .. vim.fn.getreg("/") .. " [" .. searchCurrent .. "/" .. searchTotal .. "]"
	else
		return ""
	end
end

require("lualine").setup({
	sections = { lualine_x = { { searchCount }, "encoding", "fileformat", "filetype" } },
})

lualine.setup()
