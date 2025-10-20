### termw

This little plugin configure a terminal window to launch
common commands when programming

Commands are configured in plugin/setup.lua in 'configs' table that you can expand as needed.
Each 'configs' key must be a 'filetype' string and the value for each key is a table.
In such table two command strings which are named named with the 'run' and 'build' keys are available to be configured.
Other keys are ignored.

If a suitable configuration is found the following \<Plugin\> mapping are provided:

- '\<Plug\>(TermwRun)' launch the 'run' command (es. 'cargo run')
- '\<Plug\>(TermwBuild)' launch the 'build' command (es. 'cargo build')

You can bind them like this (vimscript):
```vimscript
:nmap <Leader>r <Plug>(TermwRun)
```

Example Configuration in plugin\setup.lua:
```lua

--- omitted text ---

-- Expand this map as needed
local configs = {
	rust = {
		build = 'cargo build',
		run = 'cargo run',
	},
	make = {
		build = 'make',
		run = 'make clean',
	}
}

--- omitted text ---
```

