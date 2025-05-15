### termw

This little plugin configure a terminal window to launch
common commands when programming

Commands are configured in plugin/setup.lua in 'configs' table, expand as needed.
Each key must be a 'filetype' string and the value for each key is a table.
In such table two commands named 'run' and 'build' are available. Other are ignored.

If a suitable configuration is found the following <Plugin> mapping are provided:

- '<Plug>(TermwRun)' launch the 'run' command (es. 'cargo run')
- '<Plug>(TermwBuild)' launch the 'build' command (es. 'cargo build')

