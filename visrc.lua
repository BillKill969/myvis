require('vis')

								-- config --

-- global
vis.events.subscribe(vis.events.INIT, function()
	vis:command("set theme gruber-dark")
end)
-- per-window
vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command("set tabwidth 4")
	vis:command("set numbers true") vis:command("set autoindent true")
	vis:command("set showspaces false")
	vis:command("set showtabs false")
	vis:command("set expandtab on")
	vis:command("set shell /usr/bin/env sh")
	vis:map(vis.modes.VISUAL," y", '"+y"')
	vis:map(vis.modes.NORMAL, " fm", function()
		vis:command("open .")
		vis:feedkeys("<C-w>k")
		vis:command("wq!")
	end, "")
end)
