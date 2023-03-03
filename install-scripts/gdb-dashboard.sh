#!/bin/bash

initpath="$HOME/.gdbinit"
rm -f "$initpath"
wget -P ~ https://git.io/.gdbinit
pip install pygments

sed -i '/Better GDB defaults/a \
# dashboard shortcut. \
define db \
    dashboard -layout source stack variables \
    dashboard source -style height 30 \
end \
\
# dashboard shortcut with threads. \
define db2 \
    dashboard -layout source stack threads variables \
    dashboard source -style height 30 \
end' "$initpath"
