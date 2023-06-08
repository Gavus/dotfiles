#!/bin/bash

tag="v0.17.2"
initpath="$HOME/.gdbinit"
url="https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/$tag/.gdbinit"

rm -f "$initpath"
wget -P ~ "$url"
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
