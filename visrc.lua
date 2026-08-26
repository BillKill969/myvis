require('vis')
local autoclose = require('plugins/vis-autoclose')
local surround = require('plugins/vis-surround')
local commentary = require('plugins/vis-commentary')
vis.events.subscribe(vis.events.INIT, function()
    vis:command('set theme default')
    -- load syntax highlighting via filetype detection
    require('plugins.filetype')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    vis:command('set expandtab')
    vis:command('set tabwidth 4')
    vis:command('set autoindent')
    vis:command('set numbers')
    vis:command('set relativenumbers')
end)

local colorizer = require('plugins/vis-colorizer')
colorizer.three = false -- (optional) diables three digit hex colors
colorizer.six   = true  -- (enabled by default) six digit hex colors

local modal = require('plugins/vis-modal')
modal.colorize({ NORMAL='black', INSERT='black', VISUAL='black',
                 VISUAL_LINE='black', REPLACE='black', OPERATOR_PENDING='black' }, '#ffffff')
