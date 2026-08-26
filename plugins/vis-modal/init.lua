--[[

	modal
	the status line colorizer for vis

]]

require('vis')

local M = {}

local MODAL_STYLE = vis.ui:style_push()
local MODAL_STYLE_FILE = vis.ui:style_push()

local MODES = {
	[vis.modes.NORMAL] = ' NORMAL ',
	[vis.modes.INSERT] = ' INSERT ',
	[vis.modes.VISUAL] = ' VISUAL ',
	[vis.modes.REPLACE] = ' REPLACE ',
	[vis.modes.VISUAL_LINE] = ' VISUAL_LINE ',
	[vis.modes.OPERATOR_PENDING] = ' OPERATOR_PENDING ',
}
M.MODES = MODES

M.filecolor = 'fore:white,back:#242423'

local STYLES = {
	[vis.modes.NORMAL] = {
		REGULAR = 'fore:white,back:yellow',
	},
	[vis.modes.INSERT] = {
		REGULAR = 'fore:white,back:green',
	},
	[vis.modes.VISUAL] = {
		REGULAR = 'fore:white,back:magenta',
	},
	[vis.modes.REPLACE] = {
		REGULAR = 'fore:white,back:blue',
	},
	[vis.modes.VISUAL_LINE] = {
		REGULAR = 'fore:white,back:magenta',
	},
	[vis.modes.OPERATOR_PENDING] = {
		REGULAR = 'fore:white,back:blue',
	},
}
M.STYLES = STYLES

vis.events.subscribe(vis.events.WIN_STATUS, function(win)
	local modified = ''
	if win.file.modified then modified = ' *' end
	local filename = ' [NO NAME]'..modified..' '
	if win.file.name then filename = ' '..win.file.name..modified..' ' end
	local vmode = MODES[vis.mode]
	local recording = ''
	if vis.recording then
		recording = ' @ RECORDING'
	end
	status_left = vmode..filename..recording

	cursors = 0
	for _ in win:selections_iterator() do cursors = cursors+1 end
	selection_size = "SELECTION_SIZE: "..
		win.selection.range.finish - win.selection.range.start
	cursor_amount = "CURSORS: "..cursors
	cursor_pos = win.selection.line..":"..win.selection.col
	status_right = selection_size.." | "..cursor_amount.." | "..cursor_pos

	win:status(status_left, status_right)

        local style = STYLES[vis.mode] or STYLES[vis.modes.NORMAL]
            for win in vis:windows() do
                    vis.ui:style_define(MODAL_STYLE,      style.REGULAR)
                            vis.ui:style_define(MODAL_STYLE_FILE, M.filecolor)
                                end

	for i=0,win.width do
		win:style_pos(MODAL_STYLE, i, win.height - 1)
	end
	for i=string.len(vmode),string.len(vmode)+string.len(filename)-1 do
		win:style_pos(MODAL_STYLE_FILE, i, win.height - 1)
	end
end)
    M.colorize = function(colors, text)
        text = text or 'white'
        for key, color in pairs(colors) do
        local mode = key
        if type(key) == 'string' then mode = vis.modes[key] end
        if mode then
        M.STYLES[mode] = { REGULAR = 'fore:'..text..',back:'..color }
        end
        end
        end
return M
